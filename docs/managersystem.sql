SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID,一级菜单为0',
                            `name` varchar(64) NOT NULL,
                            `path` varchar(64) DEFAULT NULL COMMENT '菜单URL',
                            `perms` varchar(255) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如:user:list,user:create)',
                            `component` varchar(255) DEFAULT NULL,
                            `type` int(5) NOT NULL COMMENT '类型 0:目录 1:菜单 2:按钮',
                            `icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
                            `order_num` int(11) DEFAULT NULL COMMENT '排序',
                            `create_time` datetime DEFAULT NULL,
                            `update_time` datetime DEFAULT NULL,
                            `status` int(5) NOT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `name` (`name`) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `name` varchar(64) NOT NULL,
                            `code` varchar(64) NOT NULL,
                            `create_time` datetime DEFAULT NULL,
                            `update_time` datetime DEFAULT NULL,
                            `status` int(5) NOT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `name` (`name`) USING BTREE,
                            UNIQUE KEY `code` (`code`) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
                                 `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                 `role_id` bigint(20) NOT NULL,
                                 `menu_id` bigint(20) NOT NULL,
                                 PRIMARY KEY (`id`)
)ENGINE = InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `username` varchar(64) DEFAULT NULL,
                            `password` varchar(64) DEFAULT NULL,
                            `avatar` varchar(255) DEFAULT NULL,
                            `email` varchar(64) DEFAULT NULL,
                            `city` varchar(64) DEFAULT NULL,
                            `create_time` datetime DEFAULT NULL,
                            `update_time` datetime DEFAULT NULL,
                            `status` int(5) NOT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `UK_USERNAME` (`username`) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
                                 `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                 `user_id` bigint(20) NOT NULL,
                                 `role_id` bigint(20) NOT NULL,
                                 PRIMARY KEY (`id`)
)ENGINE = InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET = utf8mb4;