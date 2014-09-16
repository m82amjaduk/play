<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/

$route['default_controller']    = "about/home";
$route['404_override']          = 'error/error_404';

$route['aboutus']               = "about/us";
$route['home']                  = "about/home";
$route['gallery']               = "about/gallery";
$route['contact']               = "about/contact";
$route['specialoffers']         = "about/offers";


$route['ourmenu/(:any)']        = "takeaway/menu/$1";
$route['orderonline']           = "takeaway/menu/2";
$route['orderdetails']          = "takeaway/order_details";
$route['userdetails']           = "takeaway/user_details";
$route['confirm']               = "takeaway/confirm";
$route['checkout']              = "takeaway/confirm";
$route['orderplaced/(:any)']    = "takeaway/order_placed/$1";
$route['dc']                    = "takeaway/deleteALLCache";
$route['aud']                   = "takeaway/all_userdata";
$route['sms']                   = "takeaway/sms";


/* End of file routes.php */
/* Location: ./application/config/routes.php */