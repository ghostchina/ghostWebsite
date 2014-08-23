/*
 Navicat MySQL Data Transfer

 Source Server         : ghostchina_test
 Source Server Version : 50538
 Source Host           : 118.192.71.245
 Source Database       : ghostchina_blog

 Target Server Version : 50538
 File Encoding         : utf-8

 Date: 08/23/2014 14:04:30 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `accesstokens`
-- ----------------------------
DROP TABLE IF EXISTS `accesstokens`;
CREATE TABLE `accesstokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accesstokens_token_unique` (`token`),
  KEY `accesstokens_user_id_foreign` (`user_id`),
  KEY `accesstokens_client_id_foreign` (`client_id`),
  CONSTRAINT `accesstokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `accesstokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `accesstokens`
-- ----------------------------
BEGIN;
INSERT INTO `accesstokens` VALUES ('3', '4XcUTHXXVHGa4zuyIFrlltMymahuRIDLk195bJp9dam7V1sFg8Ny8lmRyaB03vgWe1NKTq1Kv9cDTVOeRnz4GfhFXpclbd6XqKNBY3omqWpNXI1yyfOrni5Uuc9Y6daSFUJMgJL5x0UnDo7i8ZNDpito5w5pOIfTPnPyDnIAl67kX5rdhjg2zGvlhIpfZMkd0HAaOrz5RxQPA31qdTVb6EyvrjEavWEHwzSVZF5cnVpBiEkVKwDzGjBNYOOjXXe', '1', '1', '1408769951958'), ('4', 'BkJXA67LdMiKyxJXrs9TVdsa9x4SPdBxSrC7iux5AuOSf6dwWqMxT2c4OfzL5xFDA3m2pUpPzFiEQEiWE5NzIYVBuTZMSy3Vgy5vEqQZSMKMA24gMDirJrMy8kQtgGU5iEykLf04BcvQsK37ejL6KTLEoKr7IbkNKDkK77kxbaVefYmLrKWth8qTSZnKVoSTfU6BDp503Z0N5n8UX6hxUTxexDUVLkNgKvwioOWDxxpqFVOmE3BJx2uIgz1V9vy', '1', '1', '1408775978828');
COMMIT;

-- ----------------------------
--  Table structure for `app_fields`
-- ----------------------------
DROP TABLE IF EXISTS `app_fields`;
CREATE TABLE `app_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'html',
  `app_id` int(10) unsigned NOT NULL,
  `relatable_id` int(10) unsigned NOT NULL,
  `relatable_type` varchar(150) NOT NULL DEFAULT 'posts',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_fields_app_id_foreign` (`app_id`),
  CONSTRAINT `app_fields_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `app_settings`
-- ----------------------------
DROP TABLE IF EXISTS `app_settings`;
CREATE TABLE `app_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `app_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_settings_key_unique` (`key`),
  KEY `app_settings_app_id_foreign` (`app_id`),
  CONSTRAINT `app_settings_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `apps`
-- ----------------------------
DROP TABLE IF EXISTS `apps`;
CREATE TABLE `apps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `version` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'inactive',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apps_name_unique` (`name`),
  UNIQUE KEY `apps_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `clients`
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `secret` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_name_unique` (`name`),
  UNIQUE KEY `clients_slug_unique` (`slug`),
  UNIQUE KEY `clients_secret_unique` (`secret`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `clients`
-- ----------------------------
BEGIN;
INSERT INTO `clients` VALUES ('1', '04b14e7d-29d8-4f1a-b4af-7e3296501d1b', 'Ghost Admin', 'ghost-admin', 'not_available', '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1');
COMMIT;

-- ----------------------------
--  Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `action_type` varchar(150) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `permissions`
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES ('1', '8f4fdd7d-83a3-4d20-8b81-c43dfd0c180e', 'Export database', 'db', 'exportContent', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('2', 'c15498e2-5a36-4d01-87c0-ac5941fc5008', 'Import database', 'db', 'importContent', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('3', '56f9282e-6128-477d-b182-19e5b8dd183e', 'Delete all content', 'db', 'deleteAllContent', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('4', 'e15962f5-2fa8-4e82-a01f-db9555d8f648', 'Send mail', 'mail', 'send', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('5', 'e4de967d-01ec-4e4c-99a0-807c3538ca85', 'Browse notifications', 'notification', 'browse', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('6', '60423821-3ae7-4ce2-a62c-220281c5e731', 'Add notifications', 'notification', 'add', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('7', '6a58847b-440c-4e55-90bf-b5069ef491ce', 'Delete notifications', 'notification', 'destroy', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('8', 'c8425e5b-3f43-419a-ab8e-9d6911bc3740', 'Browse posts', 'post', 'browse', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('9', '73cf2afa-0cce-4ee0-af8e-964566b8d40b', 'Read posts', 'post', 'read', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('10', '6ebffce3-1370-4a0e-aaf1-4ebd9aa91622', 'Edit posts', 'post', 'edit', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('11', '8f3eb845-134e-4124-ad85-c884d1bac8b6', 'Add posts', 'post', 'add', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('12', 'cd13509e-290c-4268-863b-c26c465a1741', 'Delete posts', 'post', 'destroy', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('13', 'a790ceb4-54ba-4ce4-a707-ed573697e7d9', 'Browse settings', 'setting', 'browse', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('14', '4f73d5f1-d35d-45bd-887f-36158b707cd0', 'Read settings', 'setting', 'read', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('15', '16592e6c-dd0f-4b7e-a529-5fb53e0469fd', 'Edit settings', 'setting', 'edit', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('16', 'd7c09949-dff9-40b4-bc7f-6b62d8d4c056', 'Generate slugs', 'slug', 'generate', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('17', 'dda2cdb2-a2d3-4e5a-b9cd-ad5518ccb302', 'Browse tags', 'tag', 'browse', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('18', 'e6403e0b-dd58-4bd1-b4f7-ab42d27ce83d', 'Read tags', 'tag', 'read', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('19', '62038fb0-34cc-44fc-86df-85b2a0697c45', 'Edit tags', 'tag', 'edit', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('20', 'a79c1333-6343-43dc-a44f-7a5b0caa37f9', 'Add tags', 'tag', 'add', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('21', '374f39a6-c6a2-4b7b-bb8d-de97bc0cfb7f', 'Delete tags', 'tag', 'destroy', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('22', '655fff8f-dee1-4e01-aeb9-670e0262b810', 'Browse themes', 'theme', 'browse', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('23', 'b123542d-91e5-4be7-9ec9-65a7e3a90b01', 'Edit themes', 'theme', 'edit', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('24', 'c79f7af9-a9a1-4967-b600-1c8204393b68', 'Browse users', 'user', 'browse', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('25', 'a7476f55-8c1e-4a79-bbf5-be5d04c53a77', 'Read users', 'user', 'read', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('26', '97d5a098-497a-4973-ba2a-86e270e37384', 'Edit users', 'user', 'edit', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('27', 'fac78c88-68ac-4354-8f88-471e91319ece', 'Add users', 'user', 'add', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('28', '08aa4cbc-bfaa-4f22-98af-f9e432402779', 'Delete users', 'user', 'destroy', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('29', 'b39fb5ba-6b57-4808-97dd-b707348e3214', 'Assign a role', 'role', 'assign', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('30', 'bd12429b-59a4-43b0-92f4-65b2411b0652', 'Browse roles', 'role', 'browse', null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1');
COMMIT;

-- ----------------------------
--  Table structure for `permissions_apps`
-- ----------------------------
DROP TABLE IF EXISTS `permissions_apps`;
CREATE TABLE `permissions_apps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `permissions_roles`
-- ----------------------------
DROP TABLE IF EXISTS `permissions_roles`;
CREATE TABLE `permissions_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `permissions_roles`
-- ----------------------------
BEGIN;
INSERT INTO `permissions_roles` VALUES ('1', '1', '1'), ('2', '1', '2'), ('3', '1', '3'), ('4', '1', '4'), ('5', '1', '5'), ('6', '1', '6'), ('7', '1', '7'), ('8', '1', '8'), ('9', '1', '9'), ('10', '1', '10'), ('11', '1', '11'), ('12', '1', '12'), ('13', '1', '13'), ('14', '1', '14'), ('15', '1', '15'), ('16', '1', '16'), ('17', '1', '17'), ('18', '1', '18'), ('19', '1', '19'), ('20', '1', '20'), ('21', '1', '21'), ('22', '1', '22'), ('23', '1', '23'), ('24', '1', '24'), ('25', '1', '25'), ('26', '1', '26'), ('27', '1', '27'), ('28', '1', '28'), ('29', '1', '29'), ('30', '1', '30'), ('31', '2', '8'), ('32', '2', '9'), ('33', '2', '10'), ('34', '2', '11'), ('35', '2', '12'), ('36', '2', '13'), ('37', '2', '14'), ('38', '2', '16'), ('39', '2', '17'), ('40', '2', '18'), ('41', '2', '19'), ('42', '2', '20'), ('43', '2', '21'), ('44', '2', '24'), ('45', '2', '25'), ('46', '2', '26'), ('47', '2', '27'), ('48', '2', '28'), ('49', '2', '29'), ('50', '2', '30'), ('51', '3', '8'), ('52', '3', '9'), ('53', '3', '11'), ('54', '3', '13'), ('55', '3', '14'), ('56', '3', '16'), ('57', '3', '17'), ('58', '3', '18'), ('59', '3', '20'), ('60', '3', '24'), ('61', '3', '25'), ('62', '3', '30');
COMMIT;

-- ----------------------------
--  Table structure for `permissions_users`
-- ----------------------------
DROP TABLE IF EXISTS `permissions_users`;
CREATE TABLE `permissions_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `post_type`
-- ----------------------------
DROP TABLE IF EXISTS `post_type`;
CREATE TABLE `post_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_type_name_unique` (`name`),
  UNIQUE KEY `post_type_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `post_type`
-- ----------------------------
BEGIN;
INSERT INTO `post_type` VALUES ('0', null, '博客', 'article', null), ('1', null, '教程', 'course', null), ('2', null, '优秀站点', 'site', null);
COMMIT;

-- ----------------------------
--  Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `markdown` mediumtext,
  `html` mediumtext,
  `image` text,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(150) NOT NULL DEFAULT 'draft',
  `language` varchar(6) NOT NULL DEFAULT 'zh_CN',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` int(11) DEFAULT NULL,
  `post_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `posts`
-- ----------------------------
BEGIN;
INSERT INTO `posts` VALUES ('1', '84af91b4-47c5-452d-b882-cfdf4c2aaad4', 'Welcome to Ghost', 'welcome-to-ghost', 'You\'re live! Nice. We\'ve put together a little post to introduce you to the Ghost editor and get you started. You can manage your content by signing in to the admin area at `<your blog URL>/ghost/`. When you arrive, you can select this post from a list on the left and see a preview of it on the right. Click the little pencil icon at the top of the preview to edit this post and read the next section!\n\n## Getting Started\n\nGhost uses something called Markdown for writing. Essentially, it\'s a shorthand way to manage your post formatting as you write!\n\nWriting in Markdown is really easy. In the left hand panel of Ghost, you simply write as you normally would. Where appropriate, you can use *shortcuts* to **style** your content. For example, a list:\n\n* Item number one\n* Item number two\n    * A nested item\n* A final item\n\nor with numbers!\n\n1. Remember to buy some milk\n2. Drink the milk\n3. Tweet that I remembered to buy the milk, and drank it\n\n### Links\n\nWant to link to a source? No problem. If you paste in url, like http://ghost.org - it\'ll automatically be linked up. But if you want to customise your anchor text, you can do that too! Here\'s a link to [the Ghost website](http://ghost.org). Neat.\n\n### What about Images?\n\nImages work too! Already know the URL of the image you want to include in your article? Simply paste it in like this to make it show up:\n\n![The Ghost Logo](https://ghost.org/images/ghost.png)\n\nNot sure which image you want to use yet? That\'s ok too. Leave yourself a descriptive placeholder and keep writing. Come back later and drag and drop the image in to upload:\n\n![A bowl of bananas]\n\n\n### Quoting\n\nSometimes a link isn\'t enough, you want to quote someone on what they\'ve said. It was probably very wisdomous. Is wisdomous a word? Find out in a future release when we introduce spellcheck! For now - it\'s definitely a word.\n\n> Wisdomous - it\'s definitely a word.\n\n### Working with Code\n\nGot a streak of geek? We\'ve got you covered there, too. You can write inline `<code>` blocks really easily with back ticks. Want to show off something more comprehensive? 4 spaces of indentation gets you there.\n\n    .awesome-thing {\n        display: block;\n        width: 100%;\n    }\n\n### Ready for a Break? \n\nThrow 3 or more dashes down on any new line and you\'ve got yourself a fancy new divider. Aw yeah.\n\n---\n\n### Advanced Usage\n\nThere\'s one fantastic secret about Markdown. If you want, you can  write plain old HTML and it\'ll still work! Very flexible.\n\n<input type=\"text\" placeholder=\"I\'m an input field!\" />\n\nThat should be enough to get you started. Have fun - and let us know what you think :)', '<p>You\'re live! Nice. We\'ve put together a little post to introduce you to the Ghost editor and get you started. You can manage your content by signing in to the admin area at <code>&lt;your blog URL&gt;/ghost/</code>. When you arrive, you can select this post from a list on the left and see a preview of it on the right. Click the little pencil icon at the top of the preview to edit this post and read the next section!</p>\n\n<h2 id=\"gettingstarted\">Getting Started</h2>\n\n<p>Ghost uses something called Markdown for writing. Essentially, it\'s a shorthand way to manage your post formatting as you write!</p>\n\n<p>Writing in Markdown is really easy. In the left hand panel of Ghost, you simply write as you normally would. Where appropriate, you can use <em>shortcuts</em> to <strong>style</strong> your content. For example, a list:</p>\n\n<ul>\n<li>Item number one</li>\n<li>Item number two\n<ul><li>A nested item</li></ul></li>\n<li>A final item</li>\n</ul>\n\n<p>or with numbers!</p>\n\n<ol>\n<li>Remember to buy some milk  </li>\n<li>Drink the milk  </li>\n<li>Tweet that I remembered to buy the milk, and drank it</li>\n</ol>\n\n<h3 id=\"links\">Links</h3>\n\n<p>Want to link to a source? No problem. If you paste in url, like <a href=\'http://ghost.org\'>http://ghost.org</a> - it\'ll automatically be linked up. But if you want to customise your anchor text, you can do that too! Here\'s a link to <a href=\"http://ghost.org\">the Ghost website</a>. Neat.</p>\n\n<h3 id=\"whataboutimages\">What about Images?</h3>\n\n<p>Images work too! Already know the URL of the image you want to include in your article? Simply paste it in like this to make it show up:</p>\n\n<p><img src=\"https://ghost.org/images/ghost.png\" alt=\"The Ghost Logo\" /></p>\n\n<p>Not sure which image you want to use yet? That\'s ok too. Leave yourself a descriptive placeholder and keep writing. Come back later and drag and drop the image in to upload:</p>\n\n<h3 id=\"quoting\">Quoting</h3>\n\n<p>Sometimes a link isn\'t enough, you want to quote someone on what they\'ve said. It was probably very wisdomous. Is wisdomous a word? Find out in a future release when we introduce spellcheck! For now - it\'s definitely a word.</p>\n\n<blockquote>\n  <p>Wisdomous - it\'s definitely a word.</p>\n</blockquote>\n\n<h3 id=\"workingwithcode\">Working with Code</h3>\n\n<p>Got a streak of geek? We\'ve got you covered there, too. You can write inline <code>&lt;code&gt;</code> blocks really easily with back ticks. Want to show off something more comprehensive? 4 spaces of indentation gets you there.</p>\n\n<pre><code>.awesome-thing {\n    display: block;\n    width: 100%;\n}\n</code></pre>\n\n<h3 id=\"readyforabreak\">Ready for a Break?</h3>\n\n<p>Throw 3 or more dashes down on any new line and you\'ve got yourself a fancy new divider. Aw yeah.</p>\n\n<hr />\n\n<h3 id=\"advancedusage\">Advanced Usage</h3>\n\n<p>There\'s one fantastic secret about Markdown. If you want, you can  write plain old HTML and it\'ll still work! Very flexible.</p>\n\n<p><input type=\"text\" placeholder=\"I\'m an input field!\" /></p>\n\n<p>That should be enough to get you started. Have fun - and let us know what you think :)</p>', '', '0', '0', 'published', 'en_US', null, null, '1', '2014-08-17 20:29:50', '1', '2014-08-17 21:35:21', '1', '2014-08-17 20:29:50', '1', '1'), ('2', '02c0c0a2-1520-42f9-913a-957a8bdcfd6c', '下载安装说明', 'download', '### Ghost 英文版下载\n* 最新版本：[Ghost v0.5](http://dl.ghostchina.com/Ghost-0.5.0.zip)  \n* Github：[Ghost](https://github.com/TryGhost/Ghos)    \n* 上一版本：[Ghost v0.4.2](http://dl.ghostchina.com/Ghost-0.4.2.zip)  \n* Github：[Ghost](https://github.com/TryGhost/Ghost)\n\n### Ghost 中文版下载\n最新版本：[Ghost v0.5.2 (zh)](https://github.com/ghostchina/Ghost.zh)  \n安装说明：见压缩包内 README.md 文件\n\n扩展版本\n###Ghost 英文七牛云版下载\n* 最新版本：Ghost v0.4.2\n* Github：[Ghost 七牛云版](https://github.com/ghostchina/Ghost-0.4.2-qiniu)\n* [安装说明](https://github.com/ghostchina/Ghost-0.4.2-qiniu/blob/master/README.md)', '<h3 id=\"ghost\">Ghost 英文版下载</h3>\n\n<ul>\n<li>最新版本：<a href=\"http://dl.ghostchina.com/Ghost-0.5.0.zip\">Ghost v0.5</a>  </li>\n<li>Github：<a href=\"https://github.com/TryGhost/Ghos\">Ghost</a>    </li>\n<li>上一版本：<a href=\"http://dl.ghostchina.com/Ghost-0.4.2.zip\">Ghost v0.4.2</a>  </li>\n<li>Github：<a href=\"https://github.com/TryGhost/Ghost\">Ghost</a></li>\n</ul>\n\n<h3 id=\"ghost\">Ghost 中文版下载</h3>\n\n<p>最新版本：<a href=\"https://github.com/ghostchina/Ghost.zh\">Ghost v0.5.2 (zh)</a> <br />\n安装说明：见压缩包内 README.md 文件</p>\n\n<p>扩展版本</p>\n\n<h3 id=\"ghost\">Ghost 英文七牛云版下载</h3>\n\n<ul>\n<li>最新版本：Ghost v0.4.2</li>\n<li>Github：<a href=\"https://github.com/ghostchina/Ghost-0.4.2-qiniu\">Ghost 七牛云版</a></li>\n<li><a href=\"https://github.com/ghostchina/Ghost-0.4.2-qiniu/blob/master/README.md\">安装说明</a></li>\n</ul>', null, '0', '0', 'published', 'en_US', null, null, '1', '2014-08-18 19:37:47', '1', '2014-08-18 20:57:57', '1', '2014-08-18 19:37:47', '1', '0'), ('3', '94c1c15e-c28d-4ff9-a021-d348185f65ec', '常见问题', '10001', '\n\n1  npm start ghost 正常运行以后，访问/ghost 无法进入后台，显示的状态码为302\n答： 进入ghost 后台系统会自动检测更新，是否有新版本,但是国内无法访问这个地址 update.ghost.org.\n\n解决办法:替换 /core/server/update-check.js  190行\n\n```\n    return updateCheckRequest().then(updateCheckResponse).otherwise(updateCheckError);\n```  \n为\n\n```\n    //return updateCheckRequest().then(updateCheckResponse).otherwise(updateCheckError);\n    deferred.resolve();\n```  \n\n2 数据库中文乱码\n修改confi.js中database的字符集设置\n\n```\n	charset: \'UTF8_GENERAL_CI\'\n```\n\n3 主页显示很慢,界面很久才展示出来  \n答:  还是因为google被墙了，主题中引用了一个谷歌字体，删掉\ncontent/themes/casper/default.hbs 中的19行\n\n```\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"//fonts.googleapis.com/css?family=Noto+Serif:400,700,400italic|Open+Sans:700,400\" />\n```\n\n## Copyright & License\n[Ghos官网](http://ghost.org)，[ghostchina 中文网](http://www.ghostchina.com/)', '<p>1  npm start ghost 正常运行以后，访问/ghost 无法进入后台，显示的状态码为302 <br />\n答： 进入ghost 后台系统会自动检测更新，是否有新版本,但是国内无法访问这个地址 update.ghost.org.</p>\n\n<p>解决办法:替换 /core/server/update-check.js  190行</p>\n\n<pre><code>    return updateCheckRequest().then(updateCheckResponse).otherwise(updateCheckError);\n</code></pre>\n\n<p><br />\n为</p>\n\n<pre><code>    //return updateCheckRequest().then(updateCheckResponse).otherwise(updateCheckError);\n    deferred.resolve();\n</code></pre>\n\n<p>2 数据库中文乱码 <br />\n修改confi.js中database的字符集设置</p>\n\n<pre><code>    charset: \'UTF8_GENERAL_CI\'\n</code></pre>\n\n<p>3 主页显示很慢,界面很久才展示出来 <br />\n答:  还是因为google被墙了，主题中引用了一个谷歌字体，删掉\ncontent/themes/casper/default.hbs 中的19行</p>\n\n<pre><code>    &lt;link rel=\"stylesheet\" type=\"text/css\" href=\"//fonts.googleapis.com/css?family=Noto+Serif:400,700,400italic|Open+Sans:700,400\" /&gt;\n</code></pre>\n\n<h2 id=\"copyrightlicense\">Copyright &amp; License</h2>\n\n<p><a href=\"http://ghost.org\">Ghos官网</a>，<a href=\"http://www.ghostchina.com/\">ghostchina 中文网</a></p>', '', '0', '0', 'published', 'en_US', null, null, '1', '2014-08-18 19:41:33', '1', '2014-08-18 20:26:46', '1', '2014-08-18 19:41:33', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `posts_tags`
-- ----------------------------
DROP TABLE IF EXISTS `posts_tags`;
CREATE TABLE `posts_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `posts_tags`
-- ----------------------------
BEGIN;
INSERT INTO `posts_tags` VALUES ('8', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `refreshtokens`
-- ----------------------------
DROP TABLE IF EXISTS `refreshtokens`;
CREATE TABLE `refreshtokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refreshtokens_token_unique` (`token`),
  KEY `refreshtokens_user_id_foreign` (`user_id`),
  KEY `refreshtokens_client_id_foreign` (`client_id`),
  CONSTRAINT `refreshtokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `refreshtokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `refreshtokens`
-- ----------------------------
BEGIN;
INSERT INTO `refreshtokens` VALUES ('4', 'ywmt39Zmd9f8CLxxdWY984KRXcVU0ox5UMcSlPEy9GuEtmGyvPzTPTyig8enVvHFyowVp9zhchiz3rAyAZE5GkSPAmP1A9M3E2g0fZfcDnvieX139oi8RKWnaFzGR4HUZhK8ayHXJJ9SHuXAWMLwUvTGhWiyRPfihQlzLxchYyKGoMOfh8mXhrVcu4SRZEtcCzGJfxDm5U5GON1qZ5qmwBw2DFjDLWa5KHfaUrcuNQleEYa7iYRTzO40gcCOWL6', '1', '1', '1408858778828');
COMMIT;

-- ----------------------------
--  Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `roles`
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('1', '1edf8864-a9a5-4c38-8a2d-152f679e8b68', 'Administrator', 'Administrators', '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('2', 'a4cb4291-2e81-489c-946b-fa536b83bf40', 'Editor', 'Editors', '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('3', '346e2fa6-19b1-4dc7-93fd-932d731cb434', 'Author', 'Authors', '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1'), ('4', '874bb774-5421-4db3-a182-fa1965eb2158', 'Owner', 'Blog Owner', '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1');
COMMIT;

-- ----------------------------
--  Table structure for `roles_users`
-- ----------------------------
DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE `roles_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `roles_users`
-- ----------------------------
BEGIN;
INSERT INTO `roles_users` VALUES ('1', '4', '1'), ('2', '3', '2');
COMMIT;

-- ----------------------------
--  Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `settings`
-- ----------------------------
BEGIN;
INSERT INTO `settings` VALUES ('1', '1e5cba2a-4d47-47bf-94cc-9df3ac73c41e', 'databaseVersion', '003', 'core', '2014-08-17 20:29:52', '1', '2014-08-17 20:29:52', '1'), ('2', '034a0f68-0cc8-4cf6-8dc6-6a98fef07136', 'dbHash', '6039855a-6270-4e47-b4cc-0aa346a511c2', 'core', '2014-08-17 20:29:52', '1', '2014-08-17 20:29:52', '1'), ('3', 'a2d6825f-c2bc-46ff-bba9-50eec3647f7f', 'nextUpdateCheck', null, 'core', '2014-08-17 20:29:52', '1', '2014-08-17 20:29:52', '1'), ('4', '012c7b67-9179-4c6e-840a-68f85738ac55', 'displayUpdateNotification', null, 'core', '2014-08-17 20:29:52', '1', '2014-08-17 20:29:52', '1'), ('5', '8f5fd90f-4bd8-4b68-815b-86432ba9f060', 'title', 'Ghost 中文网', 'blog', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('6', '04144d14-3a81-4b77-8e14-1cd465009c7d', 'description', 'Thoughts, stories and ideas.', 'blog', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('7', '3b588223-7e21-4857-a3d5-e2e567357831', 'email', 'shanelau1021@gmail.com', 'blog', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('8', 'f89000d0-ee48-40f8-a427-fc8ff872576b', 'logo', '', 'blog', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('9', '9edfde97-cd82-4201-9169-d5c040c0bb1c', 'cover', '', 'blog', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('10', '4b8a0442-0641-47cb-b66b-19b1026d2523', 'defaultLang', 'zh-CN', 'blog', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('11', '34cc5b00-6fac-4eda-a0ec-178edebdbb99', 'postsPerPage', '5', 'blog', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('12', '02ab8bde-bfe4-4a24-aea7-67ce11719bd8', 'forceI18n', 'true', 'blog', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('13', '9499ecd9-b5f1-44d7-b2fe-640ae51751af', 'permalinks', '/:slug/', 'blog', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('14', 'c1f81978-fe3d-4f14-b426-6a1a92d4b7e8', 'activeTheme', 'ghostchina', 'theme', '2014-08-17 20:29:52', '1', '2014-08-17 21:15:17', '1'), ('15', '9c9486f2-870b-4e73-afd7-b1b1fe7c565c', 'activeApps', '[]', 'app', '2014-08-17 20:29:52', '1', '2014-08-17 20:29:52', '1'), ('16', '0582220c-c1f4-4635-b1a3-72c2ddbb6e22', 'installedApps', '[]', 'app', '2014-08-17 20:29:52', '1', '2014-08-23 11:58:05', '1');
COMMIT;

-- ----------------------------
--  Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` text,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tags`
-- ----------------------------
BEGIN;
INSERT INTO `tags` VALUES ('1', 'df7154f4-b5b0-4e55-bc66-405e16afc46b', 'Getting Started', 'getting-started', null, null, '0', null, null, null, '2014-08-17 20:29:50', '1', '2014-08-17 20:29:50', '1');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` text,
  `cover` text,
  `bio` varchar(200) DEFAULT NULL,
  `website` text,
  `location` text,
  `accessibility` text,
  `status` varchar(150) NOT NULL DEFAULT 'active',
  `language` varchar(6) NOT NULL DEFAULT 'zh_CN',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', '7804523b-ed25-4d8a-8cef-5af3eea8968a', 'Shane', 'shane', '$2a$10$./YgXGgBHgoltRKAxAEHe.Z2nHjjmjYdWR7DFe73.kE.2it36qqXa', 'shanelau1021@gmail.com', '//www.gravatar.com/avatar/1197a0109829af3b098c9b7819c45bbf?d=404&s=250', null, null, null, null, null, 'active', 'zh_CN', null, null, '2014-08-23 11:59:11', '2014-08-17 20:29:52', '1', '2014-08-23 11:59:11', '1'), ('2', '4e35ea0d-15df-444c-87f0-9807eb1922dd', 'admin', 'admin-user', '$2a$10$NOXTegxsQzq15HSZassCWOMJouDEPbC6ORKHWtmkZbBQ/2Ycb3d7u', 'admin@bootcss.com', null, null, null, null, null, null, 'invited', 'en_US', null, null, null, '2014-08-21 00:25:14', '1', '2014-08-21 00:25:14', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
