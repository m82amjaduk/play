<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Cache Class
 *
 * Debug Tools library for CodeIgniter
 *
 * @category	Libraries
 * @author		Amzad Mojumder
 * @link		##
 * @license		MIT
 * @version		01.00.01
 */

class Cart {

    private $_cart;
    private $_totalPrice;

    public function __construct() {
        $this->CI =& get_instance();
        // Load the Sessions class
        $this->CI->load->library('session' );
/*      Simple Call ....
        $this->CI->session->set_userdata('items',$items);
        $this->CI->session->userdata('items');
        $this->CI->session->unset_userdata('items');*/
        // Set value to cart
        $this->_cart = ($this->CI->session->userdata('items')) ? $this->CI->session->userdata('items') : array();
    }

    /**
     *  Get total price from cart
     *  @access	public
     *
     *  @return float
     *  $this->cart->getTotalPrice();
     */
    public function getTotalPrice(){
        $this->_totalPrice = NULL;

        if ($this->_cart){
            foreach ($this->_cart as $row){
                $rowTotal = $row['price']*$row['quantity'];
                $this->_totalPrice += $rowTotal;
            }
            return $this->_totalPrice ;
        }
        else
            return 0;
    }

    /**
     * Update cart Quantity
     * @access    public
     * @param string $type
     * @param int $index
     * @internal param $text
     * @return bool
     * $this->cart->updateQuantity('sub', 0);
     * $this->cart->updateQuantity('add', 1);
     */
    public function updateQuantity($type='add', $index=0){
        $quantityOld = $this->_cart[$index]['quantity'];
        $quantityNew = ($type=='sub') ? $quantityOld - 1 : $quantityOld + 1 ;

        if ($quantityNew < 1){
            $this->_cart = $this->removeAnItem($this->_cart, $index);
        }else {
            $this->_cart[$index]['quantity'] = $quantityNew;
        }
        $this->_setItems();
        return TRUE;
    }

    /**
     *  Remove an item from an existing array / Cart, and reindex the array
     *  @access	public
     *  @param array
     *  @param int
     *  @return array
     *  $this->cart->removeAnItem($array);
     *  $this->cart->removeAnItem($array,  0);
     */
    public function removeAnItem($items, $index=0){
        unset($items[$index]);
        $items = array_values($items);
        return $items;
    }

    /**
     *  Add An Item from to Cart.
     *  @access	public
     *  @param array
     *  @return bool
     *  $this->cart->addAnItem($array);
     */
    public function addAnItem($item ){
        array_push($this->_cart, $item);
        $this->_setItems();
        return TRUE;
    }

    /**
     *  Set cart value to session.
     *  @access	public
     *  @param array
     *  @return bool
     *  $this->_setItems();
     */
    private function _setItems(){
        $this->CI->session->set_userdata('items', $this->_cart );
        return TRUE;
    }

    /**
     *  Reset cart in session.
     *  @access	public
     *  @return bool
     *  $this->cart->resetItems();
     */
    public function resetItems(){
        $this->CI->session->unset_userdata('items');
        return TRUE;
    }

    /**
     *  Get Items in cart in session.
     *  @access	public
     *  @return array
     *  $this->cart->resetItems();
     */
    public function getItems(){
        return $this->CI->session->userdata('items');
    }

    /**
     *  Set Session Variable in cart in session.
     *  @access	public
     *  @param string
     *  @param string
     *  @return string
     *  $this->cart->setSessionVariable('takeawayDelivery', 'takeaway' );
     */
    public function setSessionVariable($key, $value ){
        $this->CI->session->set_userdata($key, $value);
        return  $value;
    }


    /**
     *  Set Session Variable in cart in session.
     *  @access	private
     *  @param string
     *  @param string
     *  $this->cart->setSessionVariableDefault();
     */
    private function _setSessionVariableDefault($key, $value ){
        $oldVal = $this->CI->session->userdata($key);
        return (empty($oldVal)) ?array($key => $value) :  array()  ;
    }


    /**
     *  Set Session Variable in cart in session.
     *  @access	public
     *  $this->cart->setSessionVariablesDefault();
     */
    public function setSessionVariablesDefault(){
        $receiving          = $this->_setSessionVariableDefault('receiving', 'collection' );
        $payMethod          = $this->_setSessionVariableDefault('payMethod', 'paypal' );
        $day                = $this->_setSessionVariableDefault('day', now());
        $time               = $this->_setSessionVariableDefault('time', '000' );

        $newData = array_merge($receiving, $payMethod, $day, $time );
        if ($newData) $this->CI->session->set_userdata($newData);
    }








}

/* End of file Cart.php */
/* Location: ./application/libraries/Cart.php */
