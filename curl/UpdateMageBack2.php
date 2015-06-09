<?php

class Tprg_HemelShipments_Helper_UpdateMagedf  extends Mage_Core_Helper_Abstract  {

    public function action($config){
        Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
        $read = Mage::getSingleton('core/resource')->getConnection("core_read");
        $write = Mage::getSingleton('core/resource')->getConnection("core_write");

        $query = "SELECT DISTINCT order_increment_id FROM hemelshipments_queue  WHERE processed=0";
        $data = $read->fetchAll($query);  // echo '<pre>'; print_r($data);  exit;

        if(!empty($data)){
            foreach ($data as $row){
                $orderIncId = $row['order_increment_id'];
                $order = Mage::getModel('sales/order')->loadByIncrementId($orderIncId); // print_r($order->getData()); // echo $order->getCustomerEmail() ; exit;

                if ($order->getId()) {
                    if ($order->canShip()) {
                        $this->processShipment($read, $write, $order, $orderIncId);
                    }else{
                        Mage::helper('hemelshipments')->logException($orderIncId . " >> Status ".$order->getStatusLabel()." >> Order exist, But can not ship ". __METHOD__);
                    }
                }else{
                    Mage::helper('hemelshipments')->logException($orderIncId . " >> Order does not exist, for the Shipment process to complete. ". __METHOD__);
                }
            }
        }
    }


    private function processShipment($read, $write, $order, $orderIncId){
        Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
        $rows = $this->getRowsOrderId($read, $orderIncId); // print_r($rows);

        $shipment = $order->prepareShipment($this->_getItemQtys($order));

        foreach ($rows as $row){
            $arrTracking = array(
                'carrier_code' => isset($row['tracking_carrier_code']) ? $row['tracking_carrier_code'] : $order->getShippingCarrier()->getCarrierCode(),
                'title' => isset($row['tracking_title']) ? $row['tracking_title'] : $order->getShippingCarrier()->getConfigData('title'),
                'number' => $row['tracking_number']
            );
            $track = Mage::getModel('sales/order_shipment_track')->addData($arrTracking);
            $shipment->addTrack($track);

            // Register Shipment
            $shipment->register();

            // Save the Shipment
            $this->_saveShipment($shipment, $order, $order->getCustomerEmail(), $row['shipment_comment']);

            // Finally, Save the Order
            $this->_saveOrder($order);
        }
    }



    private function getRowsOrderId($read, $orderIncId){
        $query = "SELECT * FROM hemelshipments_queue  WHERE order_increment_id=$orderIncId AND processed=0";
        return $read->fetchAll($query);
    }

    // http://www.magebuzz.com/blog/magento-create-multi-shipment-for-an-order-programmatically/
    public function _createShipment($orderIncrementId = '100310634'){
        Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
        // Load Order ..
        $order = Mage::getModel('sales/order')->loadByIncrementId($orderIncrementId);

        // Create Qty array
        $shipmentItems = array();
        foreach ($order->getAllItems() as $item) {
            $shipmentItems [$item->getId()] = $item->getQtyToShip();
        }

        // Prepear shipment and save ....
        if ($order->getId() && !empty($shipmentItems) && $order->canShip()) {
            $shipment = Mage::getModel('sales/service_order', $order)->prepareShipment($shipmentItems);
            $shipment->save();
        }
        Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
        echo $shipment->getIncrementId();
        return $shipment->getIncrementId();
    }


    /*Tprg_HemelShipments_Helper */
}



/*
 *
 *

    // http://inchoo.net/magento/how-to-make-order-shipment-from-code/
    public function updateShippling() {
        $orderIncrementId = '100310632';
        $type = 'typeTest';
        $code = 'codeTest';
        $order = Mage::getModel('sales/order')->loadByIncrementId($orderIncrementId);

        if($order->canShip())
        {
            $itemQty =  $order->getItemsCollection()->count();
            $shipment = Mage::getModel('sales/service_order', $order)->prepareShipment($itemQty);
            $shipment = new Mage_Sales_Model_Order_Shipment_Api();
            $shipmentId = $shipment->create($order->getId());
        }else{
            echo "\n Order Could not ship.";
        }
    }


    // http://www.amitbera.com/programmatically-create-shipment-of-a-new-order-in-magento/
    public function updateShippling2() {
        $orderIncrementId = '100310632';
        $order = Mage::getModel('sales/order')->loadByIncrementId($orderIncrementId);

        $qty=array();
        foreach($order->getAllItems() as $eachOrderItem){
            $Itemqty=0;
            $Itemqty = $eachOrderItem->getQtyOrdered()
                - $eachOrderItem->getQtyShipped()
                - $eachOrderItem->getQtyRefunded()
                - $eachOrderItem->getQtyCanceled();
            $qty[$eachOrderItem->getId()]=$Itemqty;
        }


        echo "<pre>";
        print_r($qty);
        echo "\n canShip : ".$order->canShip();

        /* check order shipment is prossiable or not  /

$email=true;
$includeComment=true;
$comment="test Shipment";

if ($order->canShip()) {
    /* @var $shipment Mage_Sales_Model_Order_Shipment */
    /* prepare to create shipment * /
    $shipment = $order->prepareShipment($qty);
    if ($shipment) {
        $shipment->register();
        $shipment->addComment($comment, $email && $includeComment);
        $shipment->getOrder()->setIsInProcess(true);
        try {
            Mage::getModel('core/resource_transaction')
                ->addObject($shipment)
                ->addObject($shipment->getOrder())
                ->save();
            $shipment->sendEmail($email, ($includeComment ? $comment : ''));
        } catch (Mage_Core_Exception $e) {
            var_dump($e);
        }
    }else {
        echo "\n Can not ship.";
    }
}

echo "\n" . __LINE__ . " > " . __METHOD__;
}

/*
    // http://stackoverflow.com/questions/9055923/magento-how-do-i-programmatically-ship-orders
    public function updateShippling3() {
        Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
        $orderIncrementId = '100310632';
        $order = Mage::getModel('sales/order')->loadByIncrementId($orderIncrementId);

        echo "\n" . __LINE__ . " > " . __METHOD__;
//create shipment
        $itemQty =  $order->getItemsCollection()->count();
        $shipment = Mage::getModel('sales/service_order', $order)->prepareShipment($itemQty);
        $shipment = new Mage_Sales_Model_Order_Shipment_Api();
        $shipmentId = $shipment->create( $order->getIncrementId(), array(), 'Shipment created through ShipMailInvoice', true, true);

        echo "\n" . __LINE__ . " > " . __METHOD__;

//add tracking info
//        $shipment_collection = Mage::getResourceModel('sales/order_shipment_collection');
//        $shipment_collection->addAttributeToFilter('order_id', $order->getId());
//        foreach($shipment_collection as $sc)
//        {
//            $shipment = Mage::getModel('sales/order_shipment');
//            $shipment->load($sc->getId());
//            if($shipment->getId() != '')
//            {
//                try
//                {
//                    Mage::getModel('sales/order_shipment_track')
//                        ->setShipment($shipment)
//                        ->setData('title', 'carrier')
//                        ->setData('number', 'fdsg')
//                        ->setData('carrier_code', 'custom')
//                        ->setData('order_id', $shipment->getData('order_id'))
//                        ->save();
//
//                }catch (Exception $e)
//                {
//                    Mage::getSingleton('core/session')->addError('order id '.$order->getId().' no found');
//                }
//            }
//        }

        echo "\n" . __LINE__ . " > " . __METHOD__;
    }*/

/*
 * http://stackoverflow.com/questions/16812397/programatically-create-shipment-for-selected-items-qty-on-order-in-magento
 * /
/*    protected function _createShipment($order, $qtysForProducts)
    {
        $shipment = $order->prepareShipment($qtysForProducts);
        if ($shipment) {
            $shipment->register();

            $shipment->sendEmail(true)
                ->setEmailSent(true)
                ->save();

            $order->setIsInProcess(true);

            $transactionSave = Mage::getModel('core/resource_transaction')
                ->addObject($shipment)
                ->addObject($shipment->getOrder())
                ->save();
        }

        return $shipment;
    }* /

/*
    public function gaOrderCompShip($orderId){   // function definition
        Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
        echo "\n$orderId";
        $email = true;
        $trackingNum = '';
        $carrier = 'custom';
        $includeComment = false;
        $comment = "Order Completed And Shipped";

        $order = Mage::getModel('sales/order')->loadByIncrementId($orderId);
        echo "\nCan Ship : ".$order->canShip();


        $convertor = Mage::getModel('sales/convert_order');
        $shipment = $convertor->toShipment($order);

        foreach ($order->getAllItems() as $orderItem) {

            if (!$orderItem->getQtyToShip()) {
                continue;
            }
            if ($orderItem->getIsVirtual()) {
                continue;
            }
            $item = $convertor->itemToShipmentItem($orderItem);
            $qty = $orderItem->getQtyToShip();
            $item->setQty($qty);
            $shipment->addItem($item);
        }

        $carrierTitle = NULL;

        if ($carrier == 'custom') {
            $carrierTitle = 'courier Service name';
        }
        $data = array();
        $data['carrier_code'] = $carrier;
        $data['title'] = $carrierTitle;
        $data['number'] = $trackingNum;

        $track = Mage::getModel('sales/order_shipment_track')->addData($data);
        $shipment->addTrack($track);

        $shipment->register();
        $shipment->addComment($comment, $email && $includeComment);
        $shipment->setEmailSent(true);
        $shipment->getOrder()->setIsInProcess(true);  print_r($shipment->debug()); exit;

        Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
        echo "\nCan Ship : ".$order->canShip();
        $transactionSave = Mage::getModel('core/resource_transaction')
            ->addObject($shipment)
            ->addObject($shipment->getOrder())
            ->save();

        Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
        $shipment->sendEmail($email, ($includeComment ? $comment : ''));
        $order->setStatus('Complete');
        $order->addStatusToHistory($order->getStatus(), $comment, false);

        $shipment->save();
    }
*


public function naveenos($val) {
    Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
    $orderId = '100310633';
    $order = Mage::getModel('sales/order')->loadByIncrementId($orderId);


    if (!$order->canShip()) {
        //$this->_getSession()->addError($this->__('Sorry! This order can not be ship.'));
        return false;
    }
    $shipment = $order->prepareShipment();
    $shipment->register();
    $order->setIsInProcess(true);
    $order->addStatusHistoryComment('Programatically shipped by naveenos Group.', false);
    $trackingDetail = array(
        'carrier_code' => 'ups',
        'title' => 'United Parcel Service',
        'number' => 'TORD23254WERZXd3', // Replace with your tracking number
    );
    $track = Mage::getModel('sales/order_shipment_track')->addData($trackingDetail);
    $shipment->addTrack($track);

    Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
    $transactionSave = Mage::getModel('core/resource_transaction')
        ->addObject($shipment)
        ->addObject($shipment->getOrder())
        ->save();
    Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);

    return true;
}


// http://magento.stackexchange.com/questions/3252/programmatically-creating-shipments
public function magento_stackexchange() {
    Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
    $orderId = '100310633';
    $order = Mage::getModel('sales/order')->loadByIncrementId($orderId);

    $itemQtys = array();
    foreach ($order->getAllItems() as $orderItem) {
        if ($orderItem->getQtyToShip() && !$orderItem->getIsVirtual()) {
            $itemQtys[$orderItem->getId()] = $orderItem->getQtyToShip();
        }
    }
    $shipment = Mage::getModel('sales/service_order', $order)->prepareShipment($itemQtys);
    $shipment->register();
    $order->setIsInProcess(true);

    Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
    Mage::getModel('core/resource_transaction')
        ->addObject($shipment)
        ->addObject($order)
        ->save();
    Mage::helper('hemelshipments')->logTrace( __LINE__ ,  __METHOD__);
}
 */