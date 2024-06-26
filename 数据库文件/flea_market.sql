/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : flea_market

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 09/12/2023 22:02:17
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sh_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_address`;
CREATE TABLE `sh_address`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consignee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `consignee_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人手机号',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `region_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `detail_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `default_flag` tinyint(0) NOT NULL COMMENT '是否默认地址',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sh_address
-- ----------------------------
INSERT INTO `sh_address` VALUES (30, '张三', '13333333333', '北京市', '市辖区', '海淀区', '海淀公园', 1, 11);
INSERT INTO `sh_address` VALUES (31, '李四', '13555555555', '北京市', '市辖区', '朝阳区', '朝阳公园', 1, 12);

-- ----------------------------
-- Table structure for sh_admin
-- ----------------------------
DROP TABLE IF EXISTS `sh_admin`;
CREATE TABLE `sh_admin`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `admin_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名字',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sh_admin
-- ----------------------------
INSERT INTO `sh_admin` VALUES (1, 'admin', '123456', '管理员');

-- ----------------------------
-- Table structure for sh_favorite
-- ----------------------------
DROP TABLE IF EXISTS `sh_favorite`;
CREATE TABLE `sh_favorite`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `create_time` datetime NOT NULL COMMENT '加入收藏的时间',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  `idle_id` bigint(0) NOT NULL COMMENT '闲置物主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `idle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sh_favorite
-- ----------------------------
INSERT INTO `sh_favorite` VALUES (48, '2023-12-09 12:32:39', 11, 113);

-- ----------------------------
-- Table structure for sh_idle_item
-- ----------------------------
DROP TABLE IF EXISTS `sh_idle_item`;
CREATE TABLE `sh_idle_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `idle_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '闲置物名称',
  `idle_details` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `picture_list` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图集',
  `idle_price` decimal(10, 2) NOT NULL COMMENT '价格',
  `idle_place` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发货地区',
  `idle_label` int(0) NOT NULL COMMENT '分类标签',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `idle_status` tinyint(0) NOT NULL COMMENT '状态（发布1、下架2、删除0）',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sh_idle_item
-- ----------------------------
INSERT INTO `sh_idle_item` VALUES (105, '短裙', '这是一件时尚轻便的单品，适合多种场合的穿着。它采用优质舒适的面料制成，穿着舒适，给人轻松自在的感觉。设计简约大方，腰部设计修身显瘦，展现出优美的曲线。这款短裙的长度适中，既不会显得过于暴露，也不会过于保守，非常适合日常穿着。它的风格多样，适合搭配各种上衣，可以轻松打造出属于你自己的时尚造型。不论是约会、聚会还是日常休闲，都是不错的选择。总之，这条二手短裙不仅具有实用性，而且能够展现你的气质与品味。希望它能够成为新主人的新宠，为她带来更多的美丽时刻。', '[\"/image?imageName=file1702111254837100201.jpg\"]', 60.00, '市辖区', 1, '2023-12-09 08:42:29', 1, 11);
INSERT INTO `sh_idle_item` VALUES (106, '闲置桌椅套装', '这套桌椅绝对是你家居空间的“大件”，不仅仅是为了添置家具，更是为了打造一个舒适时尚的居家环境。这套桌椅采用高品质原木制作，坚固耐用，同时也展现出自然清新的风格。桌面宽敞，椅子设计人性化，坐起来很舒服，背部不易疲劳。它们在家庭聚会、办公学习时都能大显身手。无论是用于工作、用餐还是休闲娱乐，都是非常实用的选择。这套桌椅的设计不仅时尚个性，而且简约大方，无论是现代、北欧或者田园风格的家庭都能搭配得恰到好处。当然，更重要的是，它将会成为你家中的一部分，见证你和家人在其中共度的美好时光。愿它找到一个全新的归宿，成为新家的焦点和温馨的象征。', '[\"/image?imageName=file1702117095675100203.jpg\"]', 199.00, '石家庄市', 2, '2023-12-09 10:18:31', 1, 11);
INSERT INTO `sh_idle_item` VALUES (107, '运动鞋9成新', '这双鞋可不是一般的潮流单品，而是诠释着你个人品味与生活态度的体现。它采用高品质的材料制成，注重舒适度的同时也不失时尚感，无论是走路还是跑步，都能确保你的脚部得到良好的支撑和舒适的体验。其设计简约大方，彰显了大胆、时尚、个性的魅力。这双鞋不仅仅是一双鞋，更是你和时尚生活的连接点。它能很好地搭配各种穿搭，无论是运动风格还是休闲搭配，都能展现出独特的魅力。无论是周末约会还是平日出行，都能成为你的得力助手。它诚意满满，希望它能找到一个新主人，为他带来更多出彩的精彩时刻。让我们一起期待它在新的旅程中，闪闪发光。', '[\"/image?imageName=file1702117196351100304.jpg\"]', 88.00, '石家庄市', 1, '2023-12-09 10:21:34', 2, 11);
INSERT INTO `sh_idle_item` VALUES (108, '一本书', '这本书虽然已经历了一些风雨，但依旧保持着鲜活的生命力。它曾被人阅读过、翻看过，每一页都沉淀着一段时光，记录着无数个思想的火花。即便已经七分新，但它内心依旧充满活力。它的纸张虽有些泛黄，但更显出岁月的韵味。随着每一页的翻阅，你可以感受到前人的智慧，体味到知识的厚重。这本书不仅是一本书，更像是一部历史的注脚，见证了无数人的成长与坚持。它所传递的温暖和智慧将会伴随你度过更多美好的时光，希望它能找到一个懂得珍惜的新主人，陪伴他探索更广阔的世界，开启新的故事。愿这本书在新的归宿中，继续闪耀光芒。', '[\"/image?imageName=file1702117328116100405.jpg\"]', 20.00, '唐山市', 4, '2023-12-09 10:24:08', 1, 11);
INSERT INTO `sh_idle_item` VALUES (109, '一瓶酒，未开封', '这瓶酒可不是一般的酒，它蕴含着无数酿酒师的心血和智慧，散发着浓厚的历史和传奇。每一滴酒都如同一个故事，传承着世代的匠心和悠久的文化。它曾陪伴着人们共度欢乐时光，见证着无数个美好的瞬间。或许它已有一些年头，但这只是岁月的痕迹，酒中散发出的芳香和回味却始终如一。它是品质与品味的结晶，更是友情与珍藏的象征。随着每一次开启，你都能品味到不同年份的记忆，感受到不同口味的惊喜。这瓶酒犹如老友般值得信赖，它希望找到一个懂得品味生活、热爱生活的新主人，与他共同分享更多精彩的故事。相信它定能为你的美好生活再添一丝色彩。', '[\"/image?imageName=file1702117551063100506.jpg\"]', 2100.00, '唐山市', 5, '2023-12-09 10:26:50', 1, 11);
INSERT INTO `sh_idle_item` VALUES (110, '白T一件', '这件白色T恤简直就是时尚界的“百搭小能手”，不仅适合男生搭配，女生穿起来也能散发出清新、自在的气质。它虽然是二手的，但已洗刷出一番属于它自己的独特韵味，还保持着整体的洁净和舒适。搭配牛仔裤，就是那种极简帅气；搭配长裙，又是那种优雅清新。不论是约会、聚会，还是日常出行，都能随心搭配。它不会像一些流行单品一样在两个月后就成为了过眼云烟，它会一直陪伴着你，见证你生活中的一切美好瞬间。这件T恤正在寻找一个新的主人，一个懂得珍惜每一件衣物、热爱慢时尚的你，穿上它，让生活更自在，让时尚更简单。它希望成为你衣柜里的一颗璀璨明珠，为你的日常搭配增添更多亮丽色彩。', '[\"/image?imageName=file1702117633184100602.jpg\"]', 30.00, '秦皇岛市', 1, '2023-12-09 10:27:53', 1, 11);
INSERT INTO `sh_idle_item` VALUES (111, '二手游戏碟片', '这张游戏碟片就像是一个时间胶囊，里面记录着无数个燃烧的游戏时光。即便已经流出了一些时间，但它依旧散发出强大的游戏魅力。每一次插入主机，都像是打开了一个充满冒险和挑战的大门，期待着再次开启那段激情燃烧的游戏旅程。尽管碟片可能略显磨损，但这都是岁月的印记，印证着它陪伴游戏玩家成长的经历。它承载着无数个惊喜与回忆，如今它渴望找到一个合适的新主人，重新点燃游戏热情。或许它会成为你游戏生涯中的一部分，见证你在游戏世界中的成长，陪伴你度过更多激动人心的冒险。愿这张碟片在新的归宿中，继续传播着游戏的独特魅力，带来更多欢乐和挑战。', '[\"/image?imageName=file1702117790448100704.jpg\"]', 21.00, '邯郸市', 3, '2023-12-09 10:30:42', 1, 11);
INSERT INTO `sh_idle_item` VALUES (112, '《幻想城》影片', '这张《幻想城》电影影片可不一般，它记录了无数观众在银幕前的热血沸腾和泪流满面。这些影像承载着无数个观众的情感与记忆，每一个场景都是如此熟悉而动人。或许影片已经有一段时光了，但它仍保留着那份珍贵与难忘。影片中的情节、对白、甚至音乐，都是那样的深入人心。它见证了无数个观众的成长与梦想，留下了无数个感动和情感的交融。如今，它渴望找到一个新主人，或者一个收藏者，重新点燃观影的激情，让更多人领略电影的魅力。或许它能成为你影视收藏的一部分，陪伴你度过更多美好的观影时光，每一次播放都唤起一段段情感记忆。愿它在新的归宿中，依旧闪耀着电影的光芒，带来更多的观影情感。', '[\"/image?imageName=file1702122206452100801.jpg\"]', 60.00, '秦皇岛市', 4, '2023-12-09 11:44:29', 2, 12);
INSERT INTO `sh_idle_item` VALUES (113, '爱宠哈士奇', '活泼友善、聪明好动和需要大量运动。引导潜在领养者考虑这些特点，确保有足够的时间和资源来照顾这只狗狗。', '[\"/image?imageName=file1702122292774100902.jpg\"]', 360.00, '唐山市', 7, '2023-12-09 11:46:17', 1, 12);
INSERT INTO `sh_idle_item` VALUES (114, '《黑色幽默》', '《黑色幽默》是一部真正经典的电影，兼具悬疑、幽默和社会讽刺元素。影片以独特的叙事风格讲述了一系列匪夷所思的故事，让人捧腹不已，同时引人深思。\n\n影片中，深刻而丰富的角色刻画，以及令人意想不到的情节发展，使这部影片成为不太寻常的电影佳作。观众跟随着角色一同踏上一段独特、离奇而又充满戏剧性的旅程。这部影片以其黑色幽默感，勾勒出一幅荒诞不经但又异常真实的社会画卷。\n\n无论是影片的幽默元素、出人意料的转折，还是对人性和社会的深刻思考，都让《黑色幽默》成为了影迷心中的经典之作。希望它将会为新的主人带来乐趣和启发，成为您收藏中的一份珍贵。', '[\"/image?imageName=file1702129711240101105.jpg\"]', 60.00, '秦皇岛市', 4, '2023-12-09 13:51:52', 2, 12);

-- ----------------------------
-- Table structure for sh_message
-- ----------------------------
DROP TABLE IF EXISTS `sh_message`;
CREATE TABLE `sh_message`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  `idle_id` bigint(0) NOT NULL COMMENT '闲置主键id',
  `content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `to_user` bigint(0) NOT NULL COMMENT '所回复的用户',
  `to_message` bigint(0) NULL DEFAULT NULL COMMENT '所回复的留言',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `idle_id_index`(`idle_id`) USING BTREE,
  INDEX `to_user_index`(`to_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sh_message
-- ----------------------------
INSERT INTO `sh_message` VALUES (48, 11, 105, '有需要的留言！', '2023-12-09 10:15:02', 11, NULL);

-- ----------------------------
-- Table structure for sh_order
-- ----------------------------
DROP TABLE IF EXISTS `sh_order`;
CREATE TABLE `sh_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  `idle_id` bigint(0) NOT NULL COMMENT '闲置物品主键id',
  `order_price` decimal(10, 2) NOT NULL COMMENT '订单总价',
  `payment_status` tinyint(0) NOT NULL COMMENT '支付状态',
  `payment_way` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint(0) NOT NULL COMMENT '订单状态',
  `is_deleted` tinyint(0) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sh_order
-- ----------------------------
INSERT INTO `sh_order` VALUES (86, '170212944205710002', 12, 107, 88.00, 1, '支付宝', '2023-12-09 13:44:02', '2023-12-09 13:45:18', 3, NULL);
INSERT INTO `sh_order` VALUES (87, '170213014337110003', 11, 114, 60.00, 1, '支付宝', '2023-12-09 13:55:43', '2023-12-09 13:55:57', 3, NULL);

-- ----------------------------
-- Table structure for sh_order_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_order_address`;
CREATE TABLE `sh_order_address`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(0) NOT NULL COMMENT '订单id',
  `consignee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderId`(`order_id`) USING BTREE,
  INDEX `order_id_index`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sh_order_address
-- ----------------------------
INSERT INTO `sh_order_address` VALUES (23, 86, '李四', '13555555555', '北京市市辖区朝阳区朝阳公园');
INSERT INTO `sh_order_address` VALUES (24, 87, '张三', '13333333333', '北京市市辖区海淀区海淀公园');

-- ----------------------------
-- Table structure for sh_type
-- ----------------------------
DROP TABLE IF EXISTS `sh_type`;
CREATE TABLE `sh_type`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_type
-- ----------------------------
INSERT INTO `sh_type` VALUES (1, '服饰首饰');
INSERT INTO `sh_type` VALUES (2, '家电家具');
INSERT INTO `sh_type` VALUES (3, '电子产品');
INSERT INTO `sh_type` VALUES (4, '图书音像');
INSERT INTO `sh_type` VALUES (5, '食品生鲜');
INSERT INTO `sh_type` VALUES (6, '运动户外');
INSERT INTO `sh_type` VALUES (7, '宠物花卉');
INSERT INTO `sh_type` VALUES (8, '其他');

-- ----------------------------
-- Table structure for sh_user
-- ----------------------------
DROP TABLE IF EXISTS `sh_user`;
CREATE TABLE `sh_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号（手机号）',
  `user_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `sign_in_time` datetime NOT NULL COMMENT '注册时间',
  `user_status` tinyint(0) NULL DEFAULT NULL COMMENT '状态（1代表封禁）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sh_user
-- ----------------------------
INSERT INTO `sh_user` VALUES (11, '13333333333', '123456', '张三', '/image?imageName=file1702122419646101007.jpg', '2023-12-08 13:18:34', 0);
INSERT INTO `sh_user` VALUES (12, '13555555555', '123456', '李四', '/image?imageName=noasndo123.jpg', '2023-12-09 11:43:04', NULL);

SET FOREIGN_KEY_CHECKS = 1;
