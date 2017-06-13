<?php
/**根据用户id查询订单数据**/
header('Content-Type:application/json');

$output = [];

@$userid = $_REQUEST['userid'];

if(empty($userid)){
    echo "[]"; //若客户端未提交用户id，则返回一个空数组，
    return;    //并退出当前页面的执行
}

//访问数据库
require('init.php');

$sql = "SELECT fruit_order.oid,fruit_order.userid,fruit_order.phone,fruit_order.addr,
fruit_order.totalprice,fruit_order.user_name,fruit_order.order_time,
fruit_orderdetails.did,fruit_orderdetails.dishcount,fruit_orderdetails.price,
fruit_dish.name,fruit_dish.img_sm

 from fruit_order,fruit_orderdetails,fruit_dish
WHERE fruit_order.oid = fruit_orderdetails.oid and fruit_orderdetails.did = fruit_dish.did and fruit_order.userid='$userid'";
$result = mysqli_query($conn, $sql);

$output['data'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($output);
?>
