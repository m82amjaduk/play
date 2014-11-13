 DROP TABLE IF EXISTS orders_state;
 CREATE TABLE IF NOT EXISTS `orders_state` (
`id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
`login_id` bigint(20) NOT NULL DEFAULT '1',
`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`active` TINYINT(1) NOT NULL DEFAULT '1',
`sn` INT(1) NOT NULL DEFAULT '1',
`state` VARCHAR(767) UNIQUE NOT NULL DEFAULT 'processing',
`message` TEXT,
`customer_can_view` TINYINT(1) NOT NULL DEFAULT '1',
`send_email` TINYINT(1) NOT NULL DEFAULT '1',
`send_sms` TINYINT(1) NOT NULL DEFAULT '0',
`response_required` TINYINT(1) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';




INSERT INTO `orders_state` (`id`, `login_id`, `updated`, `active`, `sn`, `state`, `message`, `customer_can_view`, `send_email`, `send_sms`, `response_required`) VALUES
	(00000000001, 1, '2014-11-13 10:25:54', 1, 1, 'order_placed', 'Order placed with us', 1, 1, 0, 0),
	(00000000002, 1, '2014-11-13 10:52:59', 1, 2, 'received', 'We have received the order, We will let you know shortly if thre is any issue', 1, 1, 0, 0),
	(00000000003, 1, '2014-11-13 10:53:02', 1, 3, 'accepted', 'We have accepted your order, your order will be ready with us in 20 min', 1, 1, 0, 0),
	(00000000004, 1, '2014-11-13 10:53:08', 1, 4, 'processing', 'We are processing your order now', 1, 1, 0, 0),
	(00000000005, 1, '2014-11-13 12:27:21', 1, 5, 'on_hold', 'Oops… there was a problem with your order. Please contact us as soon as possiable', 1, 1, 0, 1),
	(00000000006, 1, '2014-11-13 12:27:26', 1, 6, 'waiting_on_customer_responce', 'We are waiting on your response, Please contact us as soon as possiable/', 1, 1, 0, 1),
	(00000000007, 1, '2014-11-13 10:53:16', 1, 7, 'waiting_on_driver', 'Your food is ready. We are waiting for our driver to deliver your food', 1, 1, 0, 0),
	(00000000008, 1, '2014-11-13 10:53:18', 1, 8, 'cooking', 'Now we are cooking your food.', 1, 1, 0, 0),
	(00000000009, 1, '2014-11-13 10:53:20', 1, 9, 'out_for_delivery', 'Your fodd is on its way. You should receive your meal shortly', 1, 1, 0, 0),
	(00000000010, 1, '2014-11-13 10:53:24', 1, 10, 'driver_near_by', 'Driver is very close to your home, please keep an eye ... ', 1, 1, 0, 0),
	(00000000011, 1, '2014-11-13 10:53:27', 1, 11, 'delivered', 'Your food has delivered successfully. Enjoy your meal.', 1, 1, 0, 0),
	(00000000012, 1, '2014-11-13 10:53:29', 1, 12, 'ready_for_pickup', 'We have cooked your meal and its ready for you to collect.', 1, 1, 0, 0),
	(00000000013, 1, '2014-11-13 12:27:39', 1, 13, 'too_far_for_delivery', 'Out of our delivery zone, If you do not mind you can pick from your shop.', 1, 1, 0, 1),
	(00000000014, 1, '2014-11-13 10:53:33', 1, 14, 'escalated_for_cancellation', 'We are cancelling your order, DUE TO ........................', 1, 1, 0, 0),
	(00000000015, 1, '2014-11-13 12:27:44', 1, 15, 'too_busy_to_deliver', 'We are sorry!! We are unable to deliver your food due to high volum of orders. It would be great if you could collect your food.', 1, 1, 0, 1),
	(00000000016, 1, '2014-11-13 12:27:47', 1, 16, 'too_busy', 'We are sorry!! We are unable to cook your food with in your requested time. It would be great if do not mind waiting a little longer', 1, 1, 0, 1);

SELECT GROUP_CONCAT(state ORDER BY sn ASC SEPARATOR ',') FROM orders_state WHERE active=1;