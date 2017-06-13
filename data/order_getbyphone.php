<?php
header('Content-Type:application/json');

@$phone = $_REQUEST['phone'];

if(empty($phone))
{
    echo '[]';
    return;
}

require('init.php');

$sql = "SELECT fruit_order.oid,fruit_order.addr,fruit_order.order_time,fruit_order.user_name,fruit_dish.img_sm,fruit_dish.did FROM fruit_dish,fruit_order WHERE fruit_order.phone=$phone AND fruit_order.did=fruit_dish.did";
$result = mysqli_query($conn,$sql);

$output = [];
while(true){
    $row = mysqli_fetch_assoc($result);
    if(!$row)
    {
        break;
    }
    $output[] = $row;
}

echo json_encode($output);

?>




