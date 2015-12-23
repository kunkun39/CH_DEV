INSERT INTO `system_user` VALUES (1, '2014-04-01 00:00:00', '系统管理员', '系统管理员', 'chappadmin', 'chappadmin', 1);

INSERT INTO `app_category` VALUES (1, '2014-04-01 00:00:00', '娱乐', NULL);
INSERT INTO `app_category` VALUES (2, '2014-04-01 00:00:00', '影视', 1);
INSERT INTO `app_category` VALUES (3, '2014-04-01 00:00:00', '音乐', 1);
INSERT INTO `app_category` VALUES (4, '2014-04-01 00:00:00', '健康', 1);
INSERT INTO `app_category` VALUES (5, '2014-04-01 00:00:00', '亲子', 1);

INSERT INTO `app_category` VALUES (6, '2014-04-01 00:00:00', '游戏', NULL);
INSERT INTO `app_category` VALUES (7, '2014-04-01 00:00:00', '休闲', 6);
INSERT INTO `app_category` VALUES (8, '2014-04-01 00:00:00', '棋牌', 6);
INSERT INTO `app_category` VALUES (9, '2014-04-01 00:00:00', '动作', 6);
INSERT INTO `app_category` VALUES (10, '2014-04-01 00:00:00', '其他', 6);

INSERT INTO `app_category` VALUES (11, '2014-04-01 00:00:00', '生活', NULL);
INSERT INTO `app_category` VALUES (12, '2014-04-01 00:00:00', '工具', 11);
INSERT INTO `app_category` VALUES (13, '2014-04-01 00:00:00', '教育', 11);
INSERT INTO `app_category` VALUES (14, '2014-04-01 00:00:00', '咨询', 11);
INSERT INTO `app_category` VALUES (15, '2014-04-01 00:00:00', '新闻', 11);

SET FOREIGN_KEY_CHECKS=0;
delete from app_icon;
delete from app_poster;
delete from app_file;
delete from market_app;
SET FOREIGN_KEY_CHECKS=1;