SET NAMES 'utf8';
DROP DATABASE IF EXISTS fruit;
CREATE DATABASE fruit CHARSET=UTF8;
USE fruit;

CREATE TABLE fruit_dish(
    did INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64),
    price FLOAT(6,2),
    img_sm VARCHAR(64),
    img_lg VARCHAR(64),
    detail VARCHAR(2048),
    intro VARCHAR(2048)
);
INSERT INTO fruit_dish(did,img_sm,img_lg,name,price,intro,detail) VALUES
(null,
'p01.jpg',
'p01-l.jpg',
'【猕猴桃】',
46,
'香甜如蜜 肉质鲜嫩',
'产地直发保证新鲜，含糖量达到15BRIX，低热量为您的生命注入活力'
),
(   null,
    'p02.jpg',
    'p02-l.jpg',
    '【蓝莓】',
    25,
    '圆润脆甜 细腻清香',
    '来自南半球的美味，当季果园现摘，天然健康'
),
(   null,
    'p03.jpg',
    'p03-l.jpg',
    '【山竹】',
    18.5,
    '果肉厚实 健康之选',
    '富含蛋白质和特殊脂类，让你的身心更舒爽烦躁一扫而光'
),
(   null,
    'p04.jpg',
    'p04-l.jpg',
    '【柠檬】',
    32,
    '独特清香 沁人心脾',
    '酸爽沁心，天然提神秘器，是世界上最有价值的药用水果之一，其营养价值是相当的高哦~'
),
(   null,
    'p05.jpg',
    'p05-l.jpg',
    '【牛油果】',
    8,
    '肉质鲜嫩 香甜可口',
    '热带气候，土地肥沃天然种植，只有墨西哥菜能种出完美的牛油果，而且每次必须经过多次检测才出口'
),
(   null,
    'p06.jpg',
    'p06-l.jpg',
    '【菠萝】',
    19,
    '果味浓郁 新鲜多汁',
    '金黄色果肉，细腻多汁饱满紧致，果皮无刺，不扎手，散发着浓郁的香气，让人回味无穷'
),
(   null,
    'p07.jpg',
    'p07-l.jpg',
    '【青苹果】',
    4,
    '酸甜适口 清新爽脆',
    '精品种植，智力直供，富含膳食纤维，维生素及多种微量元素'
),
(   null,
    'p08.jpg',
    'p08-l.jpg',
    '【火龙果】',
    8,
    '甜而不腻 娇艳欲滴',
    '火龙果代表着一种祝福，给长辈一份健康，营养价值高，甘甜柔软可口'
),
(   null,
    'p09.jpg',
    'p09-l.jpg',
    '【榴莲】',
    179,
    '金光灿灿 可口顺滑',
    '典型的闻得不香吃着香，营养价值极高，属于热带食物，身寒者必备'
);

##SELECT * FROM fruit_dish;

/*用户表*/
CREATE TABLE fruit_users(
    userid INT PRIMARY KEY AUTO_INCREMENT, /*购物车编号*/
    uname VARCHAR(20),                     /*用户名*/
    pwd VARCHAR(20),                       /*密码*/
    phone VARCHAR(20)                      /*电话*/
);
INSERT INTO fruit_users VALUES
(NULL,'zhangsan','11111','13111112345'),
(NULL,'lisi','22222','13819196547'),
(NULL,'lyt','123456','15910812350'),
(NULL,'王五','33333','13819196547');

/*订单表*/
CREATE TABLE fruit_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,     /*订单ID*/
    userid INT,                             /*用户*/
    phone VARCHAR(16),                      /*联系电话*/
    user_name VARCHAR(16),                  /*收货方用户名*/
    order_time LONG,                        /*下单时间*/
    addr VARCHAR(256),                      /*订单地址*/
    totalprice FLOAT(6,2)                   /*订单总价*/
);
INSERT INTO fruit_order VALUES
(NULL,1,'13501234567','大大',1445154859209,'迎春南街5号',20.5),
(NULL,1,'13501257543','琳妹妹',1445154997543,'迎春南街5号',12.5),
(NULL,2,'13207654321','小小',1445254997612,'迎春南街5号',55),
(NULL,2,'13899999999','文丽兄',1445354959209,'迎春南街5号',35),
(NULL,3,'13683675299','梅姐',1445355889209,'迎春南街5号',45);


##SELECT * FROM fruit_order;
/**购物车表**/
CREATE TABLE fruit_cart(
    ctid INT PRIMARY KEY AUTO_INCREMENT, /*购物车编号*/
    userid INT,                          /*用户编号：假定有用户id为 1 和 3 的两个用户有数据*/
    did INT,                             /*产品编号*/
    dishCount INT                      /*数量*/
);
INSERT INTO fruit_cart VALUES (null,1,1,1),
(null,1,2,4),
(null,1,5,2),
(null,3,2,10),
(null,3,6,1);
##SELECT * FROM fruit_cart;
/**订单详情表**/
CREATE TABLE fruit_orderdetails(
    oid INT ,                            /*订单编号*/
    did INT,                             /*产品id*/
    dishCount INT,                     /*购买数量*/
    price FLOAT(8,2)                     /*产品单价：需要记载，因为产品价格可能波动*/
);
INSERT INTO fruit_orderdetails VALUES (1,1,2,5),
(1,2,1,10.5),
(2,3,1,12.5),
(3,1,3,5),
(3,2,4,10),
(4,4,7,5),
(5,5,5,4),
(5,6,2,12.5);