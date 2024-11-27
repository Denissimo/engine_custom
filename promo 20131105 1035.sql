-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 6.0.493.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 05.11.2013 10:35:12
-- Версия сервера: 5.5.25
-- Версия клиента: 4.1

--
-- Описание для базы данных promo
--
DROP DATABASE IF EXISTS promo;
CREATE DATABASE IF NOT EXISTS promo
	CHARACTER SET utf8
	COLLATE utf8_general_ci;

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

-- 
-- Установка базы данных по умолчанию
--
USE promo;

--
-- Описание для таблицы access
--
CREATE TABLE IF NOT EXISTS access (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  label VARCHAR(15) DEFAULT NULL,
  param VARCHAR(50) DEFAULT NULL,
  accsize INT(11) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы actions
--
CREATE TABLE IF NOT EXISTS actions (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  user INT(10) UNSIGNED DEFAULT NULL,
  typeact TINYINT(3) UNSIGNED DEFAULT NULL,
  sumkop BIGINT(20) DEFAULT NULL,
  balance BIGINT(20) DEFAULT NULL,
  restcode VARCHAR(2) DEFAULT NULL,
  cashdate DATE DEFAULT NULL,
  cashnum TINYINT(3) UNSIGNED DEFAULT NULL,
  reserve VARCHAR(2) DEFAULT NULL,
  datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  src VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы dat_forum_cats
--
CREATE TABLE IF NOT EXISTS dat_forum_cats (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  label VARCHAR(64) DEFAULT NULL,
  catname VARCHAR(255) DEFAULT NULL,
  shortname VARCHAR(62) NOT NULL,
  datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы dat_forum_subcats
--
CREATE TABLE IF NOT EXISTS dat_forum_subcats (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  parent_id INT(10) UNSIGNED NOT NULL,
  label VARCHAR(64) DEFAULT NULL,
  subname TEXT DEFAULT NULL,
  description TEXT DEFAULT NULL,
  datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  shortsub VARCHAR(32) NOT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 16
AVG_ROW_LENGTH = 1092
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы dat_forum_topics
--
CREATE TABLE IF NOT EXISTS dat_forum_topics (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  subcat_id INT(10) UNSIGNED NOT NULL,
  uid INT(10) UNSIGNED NOT NULL,
  status TINYINT(1) DEFAULT NULL,
  topic TEXT NOT NULL,
  headmes TEXT DEFAULT NULL,
  comment TEXT DEFAULT NULL,
  datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  upic INT(10) UNSIGNED DEFAULT NULL,
  accesslist INT(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 29
AVG_ROW_LENGTH = 682
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы dat_sublist
--
CREATE TABLE IF NOT EXISTS dat_sublist (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  topic INT(10) UNSIGNED DEFAULT NULL,
  acslist VARCHAR(64) DEFAULT NULL,
  uid INT(10) UNSIGNED DEFAULT NULL,
  datetime TIMESTAMP DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы dat_subscrip
--
CREATE TABLE IF NOT EXISTS dat_subscrip (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid INT(10) UNSIGNED DEFAULT NULL,
  topic INT(10) UNSIGNED DEFAULT NULL,
  acslist INT(10) UNSIGNED DEFAULT NULL,
  user_id INT(10) UNSIGNED DEFAULT NULL,
  datetime TIMESTAMP DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы devices
--
CREATE TABLE IF NOT EXISTS devices (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  typedev TINYINT(3) UNSIGNED DEFAULT NULL,
  device VARCHAR(64) DEFAULT NULL,
  number TINYINT(3) UNSIGNED DEFAULT NULL,
  devid VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 48
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы devparam
--
CREATE TABLE IF NOT EXISTS devparam (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  device INT(10) UNSIGNED DEFAULT NULL,
  paramname VARCHAR(64) DEFAULT NULL,
  paramval TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 25
AVG_ROW_LENGTH = 33
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы events
--
CREATE TABLE IF NOT EXISTS events (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  datevent DATE DEFAULT NULL,
  timevent TIME DEFAULT NULL,
  duration TINYINT(2) DEFAULT NULL,
  timefin DATETIME DEFAULT NULL,
  namevent VARCHAR(255) DEFAULT NULL,
  typevent TINYINT(3) UNSIGNED DEFAULT NULL,
  guests INT(10) UNSIGNED DEFAULT NULL,
  notice TEXT DEFAULT NULL,
  datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 120
AVG_ROW_LENGTH = 65
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы link_event_lodge
--
CREATE TABLE IF NOT EXISTS link_event_lodge (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_event INT(10) UNSIGNED DEFAULT NULL,
  id_lodge INT(10) UNSIGNED DEFAULT NULL,
  floors INT(10) UNSIGNED DEFAULT NULL,
  pricekop BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 303
AVG_ROW_LENGTH = 25
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы link_user_acc
--
CREATE TABLE IF NOT EXISTS link_user_acc (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(11) DEFAULT NULL,
  access_id INT(11) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы link_user_ord
--
CREATE TABLE IF NOT EXISTS link_user_ord (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT(10) UNSIGNED DEFAULT NULL,
  order_id INT(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 168
AVG_ROW_LENGTH = 13
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы lodges
--
CREATE TABLE IF NOT EXISTS lodges (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  numb TINYINT(3) UNSIGNED DEFAULT NULL,
  flonum TINYINT(1) UNSIGNED DEFAULT NULL,
  typelodge TINYINT(3) UNSIGNED DEFAULT NULL,
  guests TINYINT(3) UNSIGNED DEFAULT NULL,
  notice VARCHAR(255) DEFAULT NULL,
  x INT(11) DEFAULT NULL,
  y INT(11) DEFAULT NULL,
  w INT(10) UNSIGNED DEFAULT NULL,
  h INT(10) UNSIGNED DEFAULT NULL,
  defprice BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 26
AVG_ROW_LENGTH = 85
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы orders
--
CREATE TABLE IF NOT EXISTS orders (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  dateorder DATE DEFAULT NULL,
  event INT(10) UNSIGNED DEFAULT NULL,
  lodgenum TINYINT(3) UNSIGNED DEFAULT NULL,
  linklodge INT(11) UNSIGNED DEFAULT NULL,
  typelodge TINYINT(3) UNSIGNED DEFAULT NULL,
  pricelodge BIGINT(20) UNSIGNED DEFAULT NULL,
  guests INT(10) UNSIGNED DEFAULT NULL,
  payment TINYINT(3) UNSIGNED DEFAULT NULL,
  payd TIMESTAMP DEFAULT '0000-00-00 00:00:00',
  barcode BIGINT(13) UNSIGNED DEFAULT NULL,
  dopcode BIGINT(13) UNSIGNED DEFAULT NULL,
  userid INT(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 73
AVG_ROW_LENGTH = 60
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы phpfiles
--
CREATE TABLE IF NOT EXISTS phpfiles (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  phpfile VARCHAR(75) DEFAULT NULL,
  label VARCHAR(75) DEFAULT NULL,
  val VARCHAR(75) DEFAULT NULL,
  var TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы pricelodges
--
CREATE TABLE IF NOT EXISTS pricelodges (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  event INT(10) UNSIGNED DEFAULT NULL,
  datevent DATE DEFAULT NULL,
  typelodge TINYINT(3) UNSIGNED DEFAULT NULL,
  pricekop BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 13
AVG_ROW_LENGTH = 21
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_acc_cli
--
CREATE TABLE IF NOT EXISTS sys_acc_cli (
  id_acl INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  login VARCHAR(16) DEFAULT NULL,
  acclabs VARCHAR(64) DEFAULT NULL,
  granted TINYINT(1) DEFAULT NULL,
  acl_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  user_id INT(11) NOT NULL,
  PRIMARY KEY (id_acl)
)
ENGINE = MYISAM
AUTO_INCREMENT = 424
AVG_ROW_LENGTH = 33
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_acclabels
--
CREATE TABLE IF NOT EXISTS sys_acclabels (
  id_acp INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  acclab VARCHAR(64) DEFAULT NULL,
  chpulab VARCHAR(75) DEFAULT NULL,
  PRIMARY KEY (id_acp)
)
ENGINE = MYISAM
AUTO_INCREMENT = 13
AVG_ROW_LENGTH = 26
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_accrank
--
CREATE TABLE IF NOT EXISTS sys_accrank (
  id_acp INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  acclabel VARCHAR(64) DEFAULT NULL,
  accname VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (id_acp)
)
ENGINE = MYISAM
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 37
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_actions
--
CREATE TABLE IF NOT EXISTS sys_actions (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  formname VARCHAR(255) DEFAULT NULL,
  var VARCHAR(32) DEFAULT NULL,
  act VARCHAR(8) DEFAULT NULL,
  type1 VARCHAR(16) DEFAULT NULL,
  tab VARCHAR(16) DEFAULT NULL,
  source SMALLINT(6) DEFAULT NULL,
  req TEXT DEFAULT NULL,
  phpcode VARCHAR(64) DEFAULT NULL,
  okmess TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 54
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_catalog
--
CREATE TABLE IF NOT EXISTS sys_catalog (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  label VARCHAR(75) DEFAULT NULL,
  req TEXT DEFAULT NULL,
  mask VARCHAR(255) DEFAULT NULL,
  tab VARCHAR(64) DEFAULT NULL,
  level TINYINT(3) UNSIGNED DEFAULT NULL,
  contfield VARCHAR(64) DEFAULT NULL,
  titlefield VARCHAR(64) DEFAULT NULL,
  keyfield VARCHAR(64) DEFAULT NULL,
  descfield VARCHAR(64) DEFAULT NULL,
  h1field VARCHAR(64) DEFAULT NULL,
  phpcode TEXT DEFAULT NULL,
  comments TINYINT(1) DEFAULT 0,
  slash TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 106
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_cfg
--
CREATE TABLE IF NOT EXISTS sys_cfg (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  category VARCHAR(16) DEFAULT NULL,
  numtype VARCHAR(255) DEFAULT NULL,
  val VARCHAR(255) DEFAULT NULL,
  descr TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 23
AVG_ROW_LENGTH = 20
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_chpu
--
CREATE TABLE IF NOT EXISTS sys_chpu (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  phpfile VARCHAR(75) DEFAULT NULL,
  scrip VARCHAR(75) DEFAULT NULL,
  template VARCHAR(75) DEFAULT NULL,
  parent VARCHAR(64) DEFAULT NULL,
  independ TINYINT(1) DEFAULT NULL,
  label VARCHAR(64) DEFAULT NULL,
  level TINYINT(1) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  h1 VARCHAR(255) DEFAULT NULL,
  menu VARCHAR(75) DEFAULT NULL,
  title TEXT DEFAULT NULL,
  keywords TEXT DEFAULT NULL,
  description TEXT DEFAULT NULL,
  noindex TINYINT(1) DEFAULT NULL,
  access TINYINT(1) DEFAULT NULL,
  virtual TINYINT(1) DEFAULT NULL,
  header TEXT DEFAULT NULL,
  comments TINYINT(1) DEFAULT 0,
  slash TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 92
AVG_ROW_LENGTH = 219
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_chpu2
--
CREATE TABLE IF NOT EXISTS sys_chpu2 (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  parent VARCHAR(64) DEFAULT NULL,
  independ TINYINT(1) DEFAULT NULL,
  label VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 82
AVG_ROW_LENGTH = 236
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_comments
--
CREATE TABLE IF NOT EXISTS sys_comments (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  cur_label VARCHAR(64) DEFAULT NULL,
  parent_id INT(10) UNSIGNED NOT NULL,
  params VARCHAR(256) DEFAULT NULL,
  author INT(10) UNSIGNED NOT NULL,
  touser INT(10) UNSIGNED DEFAULT NULL,
  upic TINYINT(3) UNSIGNED DEFAULT NULL,
  status TINYINT(1) DEFAULT NULL,
  headmes TEXT DEFAULT NULL,
  comment TEXT DEFAULT NULL,
  datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 116
AVG_ROW_LENGTH = 829
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_content
--
CREATE TABLE IF NOT EXISTS sys_content (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  label VARCHAR(75) DEFAULT NULL,
  val VARCHAR(75) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 73
AVG_ROW_LENGTH = 92
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_datacheck
--
CREATE TABLE IF NOT EXISTS sys_datacheck (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  formname VARCHAR(255) DEFAULT NULL,
  label VARCHAR(75) DEFAULT NULL,
  type1 VARCHAR(16) DEFAULT NULL,
  var VARCHAR(32) DEFAULT NULL,
  kind INT(10) UNSIGNED DEFAULT NULL,
  type2 VARCHAR(16) DEFAULT NULL,
  param VARCHAR(32) DEFAULT NULL,
  succ VARCHAR(16) DEFAULT NULL,
  fail VARCHAR(16) DEFAULT NULL,
  tab VARCHAR(16) DEFAULT NULL,
  errmsg TEXT DEFAULT NULL,
  sucmsg TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 81
AVG_ROW_LENGTH = 97
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_defaults
--
CREATE TABLE IF NOT EXISTS sys_defaults (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  label VARCHAR(64) DEFAULT NULL,
  varclass VARCHAR(32) DEFAULT NULL,
  varname VARCHAR(32) DEFAULT NULL,
  varindex VARCHAR(255) DEFAULT NULL,
  value VARCHAR(255) DEFAULT NULL,
  `separator` VARCHAR(1) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 16
AVG_ROW_LENGTH = 32
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_forms
--
CREATE TABLE IF NOT EXISTS sys_forms (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  nam VARCHAR(255) DEFAULT NULL,
  val VARCHAR(255) DEFAULT NULL,
  forms TEXT DEFAULT NULL,
  act VARCHAR(16) DEFAULT NULL,
  okmess TEXT DEFAULT NULL,
  tab VARCHAR(16) DEFAULT NULL,
  comeback VARCHAR(64) DEFAULT NULL,
  source SMALLINT(6) DEFAULT NULL,
  anchor TINYINT(1) DEFAULT NULL,
  sesslab TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 64
AVG_ROW_LENGTH = 336
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_iniset
--
CREATE TABLE IF NOT EXISTS sys_iniset (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  parameter VARCHAR(255) DEFAULT NULL,
  value VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 11
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_joincont
--
CREATE TABLE IF NOT EXISTS sys_joincont (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  label VARCHAR(255) DEFAULT NULL,
  tab VARCHAR(64) DEFAULT NULL,
  level TINYINT(3) UNSIGNED DEFAULT NULL,
  joinfield VARCHAR(64) DEFAULT NULL,
  contfield VARCHAR(64) DEFAULT NULL,
  titlefield VARCHAR(64) DEFAULT NULL,
  keyfield VARCHAR(64) DEFAULT NULL,
  descfield VARCHAR(64) DEFAULT NULL,
  tabfield VARCHAR(64) DEFAULT NULL,
  conttab VARCHAR(64) DEFAULT NULL,
  req TEXT DEFAULT NULL,
  slash TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_joinfields
--
CREATE TABLE IF NOT EXISTS sys_joinfields (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  joincont_id INT(10) UNSIGNED NOT NULL,
  `table` VARCHAR(64) DEFAULT NULL,
  field VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_joinlabs
--
CREATE TABLE IF NOT EXISTS sys_joinlabs (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  form VARCHAR(255) DEFAULT NULL,
  label VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 32
AVG_ROW_LENGTH = 528
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_keyfields
--
CREATE TABLE IF NOT EXISTS sys_keyfields (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  tab VARCHAR(75) DEFAULT NULL,
  keyfield VARCHAR(75) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 51
AVG_ROW_LENGTH = 26
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_redirect
--
CREATE TABLE IF NOT EXISTS sys_redirect (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  label VARCHAR(64) DEFAULT NULL,
  url VARCHAR(255) DEFAULT NULL,
  location VARCHAR(255) DEFAULT NULL,
  joinparts VARCHAR(16) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 56
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_scripts
--
CREATE TABLE IF NOT EXISTS sys_scripts (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  label VARCHAR(64) DEFAULT NULL,
  scriptype VARCHAR(4) NOT NULL,
  scrip TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 32
AVG_ROW_LENGTH = 2198
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_temps
--
CREATE TABLE IF NOT EXISTS sys_temps (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  temp TEXT DEFAULT NULL,
  label VARCHAR(75) DEFAULT NULL,
  temptype VARCHAR(16) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 20
AVG_ROW_LENGTH = 4159
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы sys_userpics
--
CREATE TABLE IF NOT EXISTS sys_userpics (
  row_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT(10) UNSIGNED DEFAULT NULL,
  label VARCHAR(64) NOT NULL,
  url VARCHAR(255) NOT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 969
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = FIXED;

--
-- Описание для таблицы sys_users
--
CREATE TABLE IF NOT EXISTS sys_users (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  rfid VARCHAR(19) DEFAULT NULL,
  account VARCHAR(19) DEFAULT NULL,
  typeuser TINYINT(3) UNSIGNED DEFAULT NULL,
  color TINYINT(3) UNSIGNED DEFAULT NULL,
  surname VARCHAR(32) DEFAULT NULL,
  firstname VARCHAR(32) DEFAULT NULL,
  middlename VARCHAR(32) DEFAULT NULL,
  company VARCHAR(64) DEFAULT NULL,
  login VARCHAR(16) DEFAULT NULL,
  pass VARCHAR(32) DEFAULT NULL,
  nick VARCHAR(32) DEFAULT NULL,
  email VARCHAR(64) DEFAULT NULL,
  phone VARCHAR(16) DEFAULT NULL,
  birthday DATE DEFAULT NULL,
  balance BIGINT(20) DEFAULT NULL,
  datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  status INT(11) UNSIGNED DEFAULT NULL,
  auth_hash VARCHAR(64) DEFAULT NULL,
  valid_till INT(11) UNSIGNED DEFAULT NULL,
  is_org INT(11) UNSIGNED DEFAULT NULL,
  sp VARCHAR(255) DEFAULT NULL,
  skype VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 196
AVG_ROW_LENGTH = 50
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы typeactions
--
CREATE TABLE IF NOT EXISTS typeactions (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  typeaction VARCHAR(64) DEFAULT NULL,
  typedev TINYINT(3) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы typechecks
--
CREATE TABLE IF NOT EXISTS typechecks (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  typecheck VARCHAR(16) DEFAULT NULL,
  exec TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 19
AVG_ROW_LENGTH = 20
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы typecolors
--
CREATE TABLE IF NOT EXISTS typecolors (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  typecolor VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 8
AVG_ROW_LENGTH = 25
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы typedevices
--
CREATE TABLE IF NOT EXISTS typedevices (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  typedevice VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 25
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы typelodges
--
CREATE TABLE IF NOT EXISTS typelodges (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  typelodge VARCHAR(64) DEFAULT NULL,
  infantry TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 21
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы typepayms
--
CREATE TABLE IF NOT EXISTS typepayms (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  typepaym VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы typeusers
--
CREATE TABLE IF NOT EXISTS typeusers (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  typeuser VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 20
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы typevents
--
CREATE TABLE IF NOT EXISTS typevents (
  id_tev INT(11) NOT NULL AUTO_INCREMENT,
  typevent VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (id_tev)
)
ENGINE = MYISAM
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 36
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы users
--
CREATE TABLE IF NOT EXISTS users (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(10) UNSIGNED DEFAULT NULL,
  firstname VARCHAR(20) DEFAULT NULL,
  middlename VARCHAR(25) DEFAULT NULL,
  lastname VARCHAR(30) DEFAULT NULL,
  phone VARCHAR(50) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  login VARCHAR(16) DEFAULT NULL,
  password VARCHAR(16) DEFAULT NULL,
  birthday DATE DEFAULT NULL,
  addate DATETIME DEFAULT NULL,
  labels TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы wiki
--
CREATE TABLE IF NOT EXISTS wiki (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  subject VARCHAR(255) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  title TEXT DEFAULT NULL,
  keywords TEXT DEFAULT NULL,
  description TEXT DEFAULT NULL,
  datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы ztest
--
CREATE TABLE IF NOT EXISTS ztest (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  bbig BIGINT(64) UNSIGNED DEFAULT NULL,
  card_deleterd TINYINT(1) DEFAULT NULL,
  field1 VARCHAR(16) DEFAULT NULL COMMENT 'фыва',
  field2 VARCHAR(16) DEFAULT NULL,
  field3 INT(10) UNSIGNED DEFAULT NULL,
  addate DATETIME DEFAULT NULL,
  PRIMARY KEY (row_id),
  INDEX field1 (field1)
)
ENGINE = MYISAM
AUTO_INCREMENT = 65
AVG_ROW_LENGTH = 28
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы zz_bukets
--
CREATE TABLE IF NOT EXISTS zz_bukets (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  bouquet VARCHAR(10) DEFAULT NULL,
  consist VARCHAR(255) DEFAULT NULL,
  pictsmall VARCHAR(50) DEFAULT NULL,
  pictlarge VARCHAR(50) DEFAULT NULL,
  categ VARCHAR(50) DEFAULT NULL,
  namerus VARCHAR(255) DEFAULT NULL,
  nameeng VARCHAR(255) DEFAULT NULL,
  descrus TEXT DEFAULT NULL,
  desceng TEXT DEFAULT NULL,
  able INT(1) DEFAULT NULL,
  totop INT(1) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 187
AVG_ROW_LENGTH = 139
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы zz_categ
--
CREATE TABLE IF NOT EXISTS zz_categ (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  nam VARCHAR(16) DEFAULT NULL,
  numsort TINYINT(3) DEFAULT NULL,
  menu TINYINT(1) DEFAULT NULL,
  catrus VARCHAR(75) DEFAULT NULL,
  cateng VARCHAR(75) DEFAULT NULL,
  title TEXT DEFAULT NULL,
  keywords TEXT DEFAULT NULL,
  description TEXT DEFAULT NULL,
  h1 TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 11
AVG_ROW_LENGTH = 394
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы zz_domains
--
CREATE TABLE IF NOT EXISTS zz_domains (
  row_id INT(10) UNSIGNED DEFAULT NULL,
  domain VARCHAR(255) NOT NULL,
  par VARCHAR(255) DEFAULT NULL,
  backlink VARCHAR(255) DEFAULT NULL,
  tic INT(10) UNSIGNED DEFAULT NULL,
  pr TINYINT(3) UNSIGNED DEFAULT NULL,
  backfind INT(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (domain)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 819
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы zz_sites
--
CREATE TABLE IF NOT EXISTS zz_sites (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  domain VARCHAR(255) DEFAULT NULL,
  backlink VARCHAR(255) DEFAULT NULL,
  tic INT(10) UNSIGNED DEFAULT NULL,
  pr TINYINT(3) UNSIGNED DEFAULT NULL,
  backfind INT(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы zzcomment
--
CREATE TABLE IF NOT EXISTS zzcomment (
  row_id INT(11) NOT NULL AUTO_INCREMENT,
  com_id INT(11) DEFAULT NULL,
  ent_id INT(11) DEFAULT NULL,
  type_id INT(11) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 10
AVG_ROW_LENGTH = 17
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы zzprofiles
--
CREATE TABLE IF NOT EXISTS zzprofiles (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT(10) UNSIGNED DEFAULT NULL,
  profile TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы zztest
--
CREATE TABLE IF NOT EXISTS zztest (
  row_id INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ФЫВА',
  bbig BIGINT(64) UNSIGNED DEFAULT NULL,
  card_deleterd TINYINT(1) DEFAULT NULL,
  field1 VARCHAR(16) DEFAULT NULL,
  field2 VARCHAR(16) DEFAULT NULL,
  field3 INT(10) UNSIGNED DEFAULT NULL,
  par INT(11) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 37
AVG_ROW_LENGTH = 21
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы zztwits
--
CREATE TABLE IF NOT EXISTS zztwits (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT(10) UNSIGNED DEFAULT NULL,
  twit TEXT DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 10
AVG_ROW_LENGTH = 1820
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы zzusers
--
CREATE TABLE IF NOT EXISTS zzusers (
  row_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) DEFAULT NULL,
  login VARCHAR(15) DEFAULT NULL,
  pass VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (row_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 31
AVG_ROW_LENGTH = 546
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы access
--

-- Таблица promo.access не содержит данных

-- 
-- Вывод данных для таблицы actions
--

-- Таблица promo.actions не содержит данных

-- 
-- Вывод данных для таблицы dat_forum_cats
--
INSERT INTO dat_forum_cats VALUES
(1, 'common', 'ОБЩИЙ ФОРУМ', 'общий', '2013-09-12 21:33:42'),
(2, 'tech222', 'ТЕХНИЧЕСКИЙ ФОРУМ', 'техничес', '2013-09-12 21:34:18'),
(3, 'market', 'ФОРУМ ДЛЯ МАРКЕТОЛОГОВ', 'маркетологи', '2013-09-12 21:34:55');

-- 
-- Вывод данных для таблицы dat_forum_subcats
--
INSERT INTO dat_forum_subcats VALUES
(1, 1, '1000000', 'КАК ЗАРАБОТАТЬ МИЛЛИОН И КУПИТЬ ОСТРОВ В ИОНИЧЕНСКОМ МОРЕ', '\tВ теме рассказывается о доступных способах заработка в метро с помощью скрипки, бубна, клавесина и дрессированной собаки\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t', '2013-09-12 21:41:41', 'миллион'),
(2, 1, '3000000', 'КАК ЗАРАБОТАТЬ ТРИ МИЛЛИОНА И КУПИТЬ ОСТРОВ В ЭГЕЙСКОМ МОРЕ', 'В теме рассказывается о доступных способах заработка в подмосковных электричках и поездах не слишком дальнего следования', '2013-09-12 21:42:32', 'три миллиона'),
(3, 1, 'billion', 'КАК ЗАРАБОТАТЬ МИЛЛИАРД И КУПИТЬ ОСТРОВ НА БЕРМУДАХ', 'В теме рассказывается о известных способах финансовых рассчетом и игр на бирже, а также о развитии офшорного типа мышления в человеке\t\t\t\t\t\t\t\r\n \t', '2013-09-12 21:43:29', 'миллиард'),
(4, 1, 'plane', 'КАК УКЛОНИТЬСЯ ОТ ПАДАЮЩЕГО САМОЛЕТА В БЕРМУДСКОМ ТРЕУГОЛЬНИКЕ', 'В теме рассказывается о доступных способах уклонения от падающих самолетов, а также нескольких десятков видов москитов и паразитах на Бермудах', '2013-09-12 21:59:50', 'самолёт'),
(5, 1, 'baloon', 'КАК УЛЕТЕТЬ НА ВОЗДУШНОМ ШАРИКЕ НА МАРС', 'В теме рассказывается о доступных способах выращивания некоторых видов зелий на Бермудских островах', '2013-09-12 21:59:52', 'аэростат'),
(6, 2, '12', 'КАК ЗАРАБОТАТЬ МИЛЛИОН И КУПИТЬ ОСТРОВ В ИОНИЧЕНСКОМ МОРЕ', 'В теме рассказывается о доступных способах заработка в метро с помощью скрипки, бубна, клавесина и дрессированной собаки', '2013-09-12 21:41:41', 'миллион'),
(7, 2, '32', 'КАК ЗАРАБОТАТЬ ТРИ МИЛЛИОНА И КУПИТЬ ОСТРОВ В ЭГЕЙСКОМ МОРЕ', 'В теме рассказывается о доступных способах заработка в подмосковных электричках и поездах не слишком дальнего следования', '2013-09-12 21:42:32', 'три миллиона'),
(8, 2, 'billion2', 'КАК ЗАРАБОТАТЬ МИЛЛИАРД И КУПИТЬ ОСТРОВ НА БЕРМУДАХ', 'В теме рассказывается о известных способах финансовых рассчетом и игр на бирже, а также о развитии офшорного типа мышления в человеке', '2013-09-12 21:43:29', 'миллиард'),
(9, 2, 'plane2', 'КАК УКЛОНИТЬСЯ ОТ ПАДАЮЩЕГО САМОЛЕТА В БЕРМУДСКОМ ТРЕУГОЛЬНИКЕ', 'В теме рассказывается о доступных способах уклонения от падающих самолетов, а также нескольких десятков видов москитов и паразитах на Бермудах', '2013-09-12 21:59:50', 'самолёт'),
(10, 2, 'baloon2', 'КАК УЛЕТЕТЬ НА ВОЗДУШНОМ ШАРИКЕ НА МАРС', 'В теме рассказывается о доступных способах выращивания некоторых видов зелий на Бермудских островах', '2013-09-12 21:59:52', 'аэростат'),
(11, 3, '13', 'КАК ЗАРАБОТАТЬ МИЛЛИОН И КУПИТЬ ОСТРОВ В ИОНИЧЕНСКОМ МОРЕ', 'В теме рассказывается о доступных способах заработка в метро с помощью скрипки, бубна, клавесина и дрессированной собаки', '2013-09-12 21:41:41', 'миллион'),
(12, 3, '33', 'КАК ЗАРАБОТАТЬ ТРИ МИЛЛИОНА И КУПИТЬ ОСТРОВ В ЭГЕЙСКОМ МОРЕ', 'В теме рассказывается о доступных способах заработка в подмосковных электричках и поездах не слишком дальнего следования', '2013-09-12 21:42:32', 'три миллиона'),
(13, 3, 'billion3', 'КАК ЗАРАБОТАТЬ МИЛЛИАРД И КУПИТЬ ОСТРОВ НА БЕРМУДАХ', 'В теме рассказывается о известных способах финансовых рассчетом и игр на бирже, а также о развитии офшорного типа мышления в человеке', '2013-09-12 21:43:29', 'миллиард'),
(14, 3, 'plane3', 'КАК УКЛОНИТЬСЯ ОТ ПАДАЮЩЕГО САМОЛЕТА В БЕРМУДСКОМ ТРЕУГОЛЬНИКЕ', 'В теме рассказывается о доступных способах уклонения от падающих самолетов, а также нескольких десятков видов москитов и паразитах на Бермудах', '2013-09-12 21:59:50', 'самолёт'),
(15, 3, 'baloon3', 'КАК УЛЕТЕТЬ НА ВОЗДУШНОМ ШАРИКЕ НА МАРС', 'В теме рассказывается о доступных способах выращивания некоторых видов зелий на Бермудских островах', '2013-09-12 21:59:52', 'аэростат');

-- 
-- Вывод данных для таблицы dat_forum_topics
--
INSERT INTO dat_forum_topics VALUES
(1, 1, 3, NULL, 'Что на имхонете', 'Имхонет фарева', 'Имхонет — это не только каталог фильмов, книг и игр, но и отзывы, советы, рецензии, а главное — персональные рекомендации, основанные на ваших собственных оценках. Вы сможете без труда подобрать то, что вам нужно, и скачать фильм, книгу или игру, а также посмотреть фильм онлайн прямо на сайте. Присоединяйтесь сейчас к 1 824 510 уже зарегистрированным пользователям!', '2013-09-13 17:02:23', NULL, NULL),
(2, 2, 4, NULL, 'Что играть на скрипке в Отрадном и Сокольниках', 'Спартак - чемпион по гладиаторским боям', 'Я никогда еще не видел таких деревьев, могущественных и величественных, глубокого богатого зеленого цвета с крапинками золота. Они возвышались, подавляли. Это были огромные сосны, дубы, клены и много других деревьев,', '2013-09-13 17:02:23', NULL, NULL),
(3, 3, 5, NULL, 'Убегай', 'Беги', 'И каменистая поверхность стала превращаться в отдельные булыжники, когда мы ехали по ней. Под булыжниками проглядывала обнаженная черная земля. Еще через несколько минут я увидел островки зелени. Сначала их было немного, но трава была ярко-ярко зеленой, такой я ее никогда не видел на Земле.\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<b>BOLD</b><br />\t\t\t\t\t\t\t\r\n<i>Italic</i><br />\t\t\t\t\t\t\t\r\nH<sub>2</sub>O нижний индекс<br />\t\t\t\t\t\t\t\r\n<p>Параграф</p>\t\t\t\t\t\t\t\r\nX<sup>2</sup>+Y<sup>2</sup> верхний индекс<br />\t\t\t\t\t\t\t\r\n<s>почёркано</s><br />\t\t\t\t\t\t\t\r\n<img src="http://www.dostavka-buketov.ru/imag/df190.jpg" title="" ><br />', '2013-09-13 17:02:24', NULL, NULL),
(4, 4, 6, NULL, 'джигурда ищет работу', 'к, иногда даже слышал, как они', 'Легкие жгло, словно я вдыхал пламя, и пот заливал глаза, но я не останавливался ни на секунду. Ботинки вязли в грязи подлеска, и каждый шаг становился всё труднее, как будто каждую секунду кто–то невидимый навешивал на мои ноги новые и новые гирьки. Но остановиться и перевести дух было нельзя. Я чувствовал, что боевики дышат в затылок, иногда даже слышал, как они перекрикиваются на своём поганом гортанном наречии.', '2013-09-13 17:02:24', NULL, NULL),
(5, 5, 7, NULL, 'Что играть на скрипке в Отрадном и Сокольниках', 'Спартак - чемпион по гладиаторским боям', 'Это длилось уже четвёртый час. Как загнанный собаками зверь, я носился по лесу в поисках форпоста, а эти твари сворой собак висели у меня на хвосте, и висели так прочно, как будто на мне висел радиомаяк, а у них в руках был пеленгатор. Навигатор разрядился, небо было плотно затянуто облачной пеленой, ни ЛЭП ни каких–либо строений я за всё это время не встретил. Мох с северной стороны деревьев – вот и все ориентиры. А форпост словно провалился сквозь землю. Я давно уже не имел чёткого представления, где я – лес был бесконечен как сибирская тайга – но что–то подсказывало: форпост там, впереди. Ещё немного и я добегу до наших. На форпосте дежурят от пяти до двенадцати бойцов, но это не важно. Даже если их только пятеро. Даже если они салаги–первогодки. С пятью вооружёнными подопечными, а главное, с боеприпасами, я мигом превращу эту толпу овцеёбов из охотников в дичь.', '2013-09-13 17:02:26', NULL, NULL),
(6, 6, 8, NULL, 'Что играть на скрипке в Отрадном и Сокольниках', 'Спартак - чемпион по гладиаторским боям', '«Калаш» болтался за спиной бесполезным грузом. Что ж, если поймают, умирать будет не так обидно. Как минимум, четверых чурок я отправил к их любимому Аллаху. Быть может, последняя длинная очередь, выпущенная мной в кусты, задела ещё одного или двух. Очень хочется на это надеяться, очень. Но один патрон оставить, наверное, стоило. Если поймают, о пуле можно будет только мечтать. В лучшем случае, мне отрежут голову. Они верят, что душе человека с отрезанной головой путь к Аллаху заказан. В худшем, со мной будут развлекаться, пока я не сдохну от болевого шока или потери крови. Поэтому, бесполезную каску и кевлар я давно выкинул на бегу. Преследователи давно поняли, что патронов у меня нет, и брать будут живым.', '2013-09-13 17:02:27', NULL, NULL),
(7, 7, 9, NULL, 'Что играть на скрипке в Отрадном и Сокольниках', 'Спартак - чемпион по гладиаторским боям', 'Ещё есть бутылка с зажигательной смесью. На кой чёрт она мне, я не знал. Нам, федералам они ни к чему, это боевики любят швырять их в танки и БТРы. Разве что разбить об голову первого, кто меня догонит, превратив его в живой факел. Но я, почему–то, потратил бесценную секунду, чтобы снять её с тела боевика. В тот момент, когда я выпустил в кусты последний патрон, сзади раздался вопль и бородатый детина бросился на меня с кинжалом. Патроны у него, наверное, тоже кончились. Тупица заорал. Накинулся бы молча – мой труп уже глодали бы шакалы. Я перехватил его руку, перекинул бородача через себя и воткнул кинжал, сжатый в его руке, ему же в брюхо. Потом снял с его пояса бутылку и метнулся в кусты, стараясь увернуться от пуль. С тех пор я не остановился ни на секунду и бежал, несмотря на то, что уже темнело в глазах и ноги подкашивались.', '2013-09-13 17:02:27', NULL, NULL),
(8, 8, 10, NULL, 'Что играть на скрипке в Отрадном и Сокольниках', 'Спартак - чемпион по гладиаторским боям', 'Грязь под ногами становилась всё жиже, и вскоре я добежал до протоки. Ручей шириной метра четыре и глубиной по щиколотку. Забежав в ручей, я рухнул, погрузив лицо в живительную влагу, и пил, пил, пил, пока не почувствовал, что вот–вот захлебнусь. Я отдышался и стал пить снова. Гортанных выкриков пока не слышно, а значит можно потратить полминуты на то, чтобы перевести дух. Мой «эскорт» наверняка измотан не меньше меня и потратит у ручья больше времени.', '2013-09-13 17:02:28', NULL, NULL),
(9, 9, 3, NULL, 'Что играть на скрипке в Отрадном и Сокольниках', 'Спартак - чемпион по гладиаторским боям', 'Ручей помогает сбить со следа. Собак у моих врагов не было, иначе они мигом бы меня догнали и порвали в клочья. Но кто знает, эти чучмеки первобытнее нас, ближе к природе, может они действительно чуют меня как волки? Иначе как понять, что я, тренированный офицер, столько времени не могу от них оторваться? Что ж, бережёного Бог бережёт, а не бережёного чурка в жопу ебёт. Попытаюсь сбить их со следа как охотничьих псов.', '2013-09-13 17:02:29', NULL, NULL),
(10, 1, 4, NULL, 'Что на Лурке', 'Луркай всё', 'Луркморе — это не только каталог фильмов, книг и игр, но и отзывы, советы, рецензии, а главное — персональные рекомендации, основанные на ваших собственных оценках. Вы сможете без труда подобрать то, что вам нужно, и скачать фильм, книгу или игру, а также посмотреть фильм онлайн прямо на сайте. Присоединяйтесь сейчас к 1 824 510 уже зарегистрированным пользователям!', '2013-09-08 17:02:31', NULL, NULL),
(11, 8, 7, NULL, 'Тема 2', 'Заголовок 3', 'Инфоооооооооо', '2013-09-16 20:54:40', NULL, NULL),
(13, 15, 7, NULL, 'Проба', 'Пробный заголовок', 'Проба с картинкой\t\t\t\t\t\t\t\r\n<br />', '2013-09-19 11:09:08', NULL, NULL),
(14, 4, 7, NULL, 'Тема сообщения:', 'Заголовок:', '<p>xhgh<img alt="" src="/images/1372926362_028db4e747ede30da8f7f6ad86340c4d.png.jpg" style="width: 397px; height: 459px;" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-19 15:08:42', NULL, NULL),
(15, 1, 7, NULL, 'Чайка', 'Улетайка', '<p><img alt="" src="/images/1369052958_2013_04_07_11_28_i_imgur_com_fdQSPgH.jpg" style="width: 278px; height: 200px;" /></p>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p>123</p>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><strike>456</strike></p>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><img alt="smiley" height="20" src="http://promo/ckeditor/plugins/smiley/images/regular_smile.gif" title="smiley" width="20" /></p>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><sub>7</sub>8<sup>9</sup></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-20 12:10:39', NULL, NULL),
(16, 1, 7, NULL, 'Это тема', 'Заголовок:', '<p><img alt="" src="/images/1369747827_polina.jpg" style="width: 462px; height: 374px;" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-23 15:24:52', NULL, NULL),
(17, 13, 7, NULL, 'WASERHG WSE', 'A DFGA', '<p>GATG A ERTGAERGAWEGE<img alt="kiss" height="20" src="http://promo/ckeditor/plugins/smiley/images/kiss.gif" title="kiss" width="20" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-23 17:18:15', NULL, NULL),
(19, 14, 7, NULL, '111111111111111111', '222222222222222222', '<p>&nbsp;ds bsd&nbsp;</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><img alt="" src="/images/1369742505_Losyash_peka.jpg" style="width: 340px; height: 279px;" /></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>&nbsp;</p>\t\t\t\t\t\t\t\r\n', '2013-09-23 17:29:40', NULL, NULL),
(20, 8, 7, NULL, 'dsdjgnd', 'dytjyjhnd', '<p>dtyjtyjndtyjndtj</p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-24 10:14:28', NULL, NULL),
(22, 8, 7, NULL, 'AAAAAAAA', 'ЫЫЫЫЫЫЫЫЫЫЫ', '<p>dtyht<img alt="" src="http://promo/images/1380003951_984-1.jpg" style="width: 400px; height: 400px;" /></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>&nbsp;</p>\t\t\t\t\t\t\t\r\n', '2013-09-24 10:15:28', NULL, NULL),
(23, 12, 7, NULL, 'asdfgasdg', 'asgasdg', '<p>asdgasg</p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-25 12:17:55', 2, NULL),
(24, 12, 7, NULL, 'asdgasg', 'asdgasg', '<p>asgasdg</p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-25 12:18:13', 2, NULL),
(25, 11, 7, NULL, '11111', '222222', '<p>3333333333</p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-25 12:22:26', 2, NULL),
(27, 11, 7, NULL, 'ыфва', 'фывп', '<p>вапмвыапмява</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>лимлмл</p>\t\t\t\t\t\t\t\r\n', '2013-09-25 13:04:24', 2, NULL),
(28, 2, 7, NULL, 'Мой первый сайт', 'Сделан в 2000 году+++', '<p><img alt="" src="/images/1369730631_kalvin.jpg" style="width: 500px; height: 505px;" /></p>\r\n', '2013-09-26 18:26:20', 2, NULL);

-- 
-- Вывод данных для таблицы dat_sublist
--

-- Таблица promo.dat_sublist не содержит данных

-- 
-- Вывод данных для таблицы dat_subscrip
--

-- Таблица promo.dat_subscrip не содержит данных

-- 
-- Вывод данных для таблицы devices
--
INSERT INTO devices VALUES
(1, 1, 'Терминал №1', 1, '35782245678'),
(2, 1, 'Терминал №2', 2, '54286532504'),
(3, 1, 'Терминал №3', 3, '23015204798'),
(4, 1, 'Терминал №4', 4, '90127545865');

-- 
-- Вывод данных для таблицы devparam
--
INSERT INTO devparam VALUES
(1, 1, 'cash10enable', 'no'),
(2, 1, 'cash50enable', 'no'),
(3, 1, 'cash100enable', 'yes'),
(4, 1, 'cash500enable', 'yes'),
(5, 1, 'cash1000enable', 'yes'),
(6, 1, 'cash5000enable', 'yes'),
(7, 2, 'cash10enable', 'no'),
(8, 2, 'cash50enable', 'no'),
(9, 2, 'cash100enable', 'yes'),
(10, 2, 'cash500enable', 'yes'),
(11, 2, 'cash1000enable', 'yes'),
(12, 2, 'cash5000enable', 'yes'),
(13, 3, 'cash10enable', 'no'),
(14, 3, 'cash50enable', 'no'),
(15, 3, 'cash100enable', 'yes'),
(16, 3, 'cash500enable', 'yes'),
(17, 3, 'cash1000enable', 'yes'),
(18, 3, 'cash5000enable', 'yes'),
(19, 4, 'cash10enable', 'no'),
(20, 4, 'cash50enable', 'no'),
(21, 4, 'cash100enable', 'yes'),
(22, 4, 'cash500enable', 'yes'),
(23, 4, 'cash1000enable', 'yes'),
(24, 4, 'cash5000enable', 'yes');

-- 
-- Вывод данных для таблицы events
--
INSERT INTO events VALUES
(43, '2012-06-19', '19:00:00', 17, '2012-06-20 12:00:00', 'Мероприятие № 11', 1, 200, 'ыарыарыр', '2012-06-18 14:54:40'),
(44, '2012-06-19', '19:00:00', 17, '2012-06-20 12:00:00', 'Мероприятие № 12', 5, 200, 'ыары', '2012-06-18 14:54:40'),
(49, '2012-06-19', '19:00:00', 17, '2012-06-20 12:00:00', 'Мероприятие № 0', 3, 200, 'ыачв', '2012-06-18 14:54:40'),
(51, '2013-09-19', '19:00:00', 17, '2013-09-20 12:00:00', 'Мероприятие № 188', 3, 150, 'яывапрыфвар', '2013-08-01 14:32:45'),
(52, '2013-12-17', '19:00:00', 17, '2013-06-20 12:00:00', 'Мероприятие № 199', 5, 150, 'апвыаям', '2012-12-17 20:36:38'),
(53, '2012-06-19', '19:00:00', 17, '2012-06-20 12:00:00', 'Мероприятие № 187', 1, 150, 'апвыаям', '2012-06-18 14:54:40'),
(55, '2012-06-19', '19:00:00', 17, '2012-06-20 12:00:00', 'Мероприятие № 26', 5, 150, 'апвыаям', '2012-06-18 14:54:40'),
(56, '2012-06-19', '19:00:00', 17, '2012-06-20 12:00:00', 'Мероприятие № 20', 1, 150, 'апвыаям', '2012-06-18 14:54:40'),
(57, '2012-06-19', '19:00:00', 17, '2012-06-20 12:00:00', 'Мероприятие № 17', 1, 150, 'чрыкер', '2012-06-18 14:54:40'),
(58, '2012-07-02', '19:00:00', 17, '2012-07-03 12:00:00', 'Мероприятие № 8', 3, 200, 'ваппр', '2012-06-18 14:54:40'),
(59, '2012-07-05', '19:00:00', 17, '2012-07-06 12:00:00', 'Мероприятие № 007', 5, 150, 'дшрпдшр', '2012-06-18 14:54:40'),
(63, '2012-07-16', '19:00:00', 17, '2012-07-17 12:00:00', 'Мероприятие № 39', 1, 150, 'zsdfhz', '2012-06-18 14:54:40'),
(64, '2012-07-20', '19:00:00', 17, '2012-07-21 12:00:00', 'Мероприятие №123', 5, 150, 'lig', '2012-06-18 14:54:40'),
(65, '2012-07-23', '19:00:00', 17, '2012-07-24 12:00:00', 'Мероприятие № 88', 4, 200, 'джлиди', '2012-06-18 14:54:40'),
(66, '2012-07-27', '19:00:00', 17, '2012-07-28 12:00:00', 'Мероприятие № 81', 4, 150, NULL, '2012-06-18 14:54:40'),
(67, '2012-07-30', '19:00:00', 17, '2012-07-31 12:00:00', 'Мероприятие № 24', 4, 150, 'джлоржр', '2012-06-18 14:54:40'),
(68, '2012-08-03', '19:00:00', 17, '2012-08-04 12:00:00', 'Мероприятие № 006', 1, 150, 'фвкп', '2012-06-18 14:54:40'),
(69, '2012-08-06', '19:00:00', 17, '2012-08-07 12:00:00', 'Мероприятие № 2012', 3, 150, 'жщло', '2012-06-18 14:54:40'),
(70, '2012-08-09', '23:00:00', 2, '2012-08-10 01:00:00', 'Мероприятие № 76', 4, 200, 'лгнап', '2012-06-18 14:54:40'),
(71, '2012-08-13', '10:00:00', 6, '2012-08-13 16:00:00', 'Тусовка утреник', 2, 120, 'sdfsgh', '2012-06-18 14:54:40'),
(72, '2012-08-19', '19:00:00', 14, '2012-08-20 09:00:00', 'Мероприятие № 254', 1, 25, 'явампява', '2012-06-18 14:54:40'),
(73, '2012-08-26', '19:00:00', 17, '2012-08-27 12:00:00', 'Мероприятие № 352', 1, 355, 'явапв;o;oij\t\t\t\t\t\t\t\r\n', '2012-06-18 14:54:40'),
(74, '2012-08-28', '18:00:00', 10, '2012-08-29 04:00:00', 'Туса', 5, 180, 'цукйау', '2012-06-18 14:54:40'),
(76, '2012-11-08', '00:00:00', 12, '2012-11-08 12:00:00', 'asfgagh ', 1, 12, 'qwertqwet', '2012-11-02 17:53:13'),
(79, '2012-12-11', '04:00:00', 12, '2012-12-11 16:00:00', 'шпнва987tg89сшл', 1, 0, 'ofvy80ofy8ggvvy8o', '2012-12-04 19:47:23'),
(80, '2012-12-13', '06:00:00', 12, '2012-12-13 18:00:00', 'asfgaghkgf', 3, 45, 'k;jhpugh', '2012-12-06 14:43:01'),
(81, '2013-02-21', '00:00:00', 12, '2013-02-21 12:00:00', 'шпнв99вшсшл', 1, NULL, NULL, '2013-02-21 17:04:09'),
(96, '2013-04-30', '00:00:00', 12, '2013-04-30 12:00:00', 'asfgagh', 1, 255, 'zsdfgadrg', '2013-02-22 14:17:51'),
(97, '2013-06-08', '00:00:00', 12, '2013-06-08 12:00:00', 'megaparty', 1, 456, 'zdgargag  S D  Z', '2013-02-22 14:22:31'),
(98, '2013-08-23', '00:00:00', 12, '2013-08-23 12:00:00', 'asdfg98756', 1, 255, 'sfgws4yws54gg4', '2013-05-30 21:58:34'),
(101, '2013-02-20', '04:00:00', 12, '2013-02-20 16:00:00', 'asfgaghdd4', 3, 12, 'sfgws4yws54gg4', '2013-02-22 14:42:30'),
(102, '2013-02-20', '00:00:00', 12, '2013-02-20 12:00:00', 'asfgaghdd5', 3, 12, 'sfgws4yws54gg4', '2013-02-22 14:56:47'),
(103, '2013-04-30', '00:00:00', 12, '2013-04-30 12:00:00', 'asfgaghdd8', 4, 321, '6767', '2013-02-27 20:14:45'),
(104, '2013-05-30', '00:00:00', 12, '2013-05-30 12:00:00', 'asfgagh3', 2, 32, '322343', '2013-02-25 20:02:19'),
(105, '2013-09-27', '18:00:00', 9, '2013-09-28 03:00:00', 'asfgagh39', 1, 34, 'ыуе', '2013-02-28 15:00:24'),
(106, '2013-07-27', '16:00:00', 4, '2013-07-27 20:00:00', 'asfgagh02', 1, 50, 'zxdfggadfg', '2013-03-06 14:53:28'),
(108, '2013-07-25', '00:00:00', 12, '2013-07-25 12:00:00', 'asfgag872', 5, 32, '13\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n', '2013-05-17 16:51:04'),
(109, '2013-11-22', '00:00:00', 12, '2013-11-22 12:00:00', 'asfga2550', 1, 35, 'лджопи', '2013-05-30 21:58:12'),
(110, '2013-05-16', '03:00:00', 12, '2013-05-16 15:00:00', 'asdga', 2, 12, 'sdfgv', '2013-05-30 20:59:39'),
(111, '2013-05-16', '00:00:00', 12, '2013-05-16 12:00:00', 'asdgaas', 1, 12, 'sdfgv', '2013-05-30 21:17:18'),
(112, '2013-07-25', '00:00:00', 8, '2013-07-25 08:00:00', 'asfga234', 1, 345, 'фвкпфвкп', '2013-06-04 17:21:27'),
(113, '2013-06-28', '00:00:00', 12, '2013-06-28 12:00:00', 'asfga238', 1, 123, 'adg', '2013-06-04 17:20:20'),
(114, '2013-08-14', '00:00:00', 5, '2013-08-14 05:00:00', 'sdfg54sdf', 1, 50, 'WERTQ', '2013-07-02 16:24:01'),
(115, '2014-01-17', '00:00:00', 12, '2014-01-17 12:00:00', 'asgarwea', 1, 123, 'asdgasdg', '2013-08-01 18:33:24'),
(116, '2013-12-13', '00:00:00', 4, '2013-12-13 04:00:00', 'zxcvsdfg123', 4, 52, '', '2013-08-08 15:19:12'),
(117, '2013-11-29', '12:00:00', 3, '2013-11-29 15:00:00', 'asfgag34е3', 5, 32, 'фцупфып', '2013-08-29 16:20:13'),
(118, '2013-11-29', '00:00:00', 3, '2013-11-29 03:00:00', 'asfgag394е3', 1, 32, 'чвари', '2013-08-29 16:21:02'),
(119, '2013-12-26', '08:00:00', 3, '2013-12-26 11:00:00', 'яыва2345', 2, 44, 'ывкп', '2013-08-29 16:57:09');

-- 
-- Вывод данных для таблицы link_event_lodge
--
INSERT INTO link_event_lodge VALUES
(273, NULL, 8, 1, 2500000),
(274, NULL, 9, 1, 3000000),
(275, NULL, 13, 1, 150000),
(276, NULL, 10, 2, 3500000),
(277, NULL, 11, 2, 3800000),
(278, NULL, 12, 3, 4000000),
(279, NULL, 7, 1, 2000000),
(280, NULL, 8, 1, 2500000),
(281, NULL, 9, 1, 3000000),
(282, NULL, 13, 1, 150000),
(283, NULL, 10, 2, 3500000),
(284, NULL, 11, 2, 3800000),
(285, NULL, 12, 3, 4000000),
(286, NULL, 7, 1, 2000000),
(287, NULL, 9, 1, 3000000),
(288, NULL, 7, 1, 2000000),
(289, NULL, 7, 1, 2000000),
(290, NULL, 8, 1, 2500000),
(291, NULL, 8, 1, 2500000),
(292, NULL, 8, 1, 2500000),
(293, NULL, 7, 1, 2000000),
(294, NULL, 8, 1, 2500000),
(295, NULL, 9, 1, 3000000),
(296, NULL, 13, 1, 150000),
(297, NULL, 10, 2, 3500000),
(298, NULL, 11, 2, 3800000),
(299, NULL, 12, 3, 4000000),
(300, 0, 9, 1, 3000000),
(301, 0, 8, 1, 2500000),
(302, 0, 12, 3, 4000000);

-- 
-- Вывод данных для таблицы link_user_acc
--

-- Таблица promo.link_user_acc не содержит данных

-- 
-- Вывод данных для таблицы link_user_ord
--
INSERT INTO link_user_ord VALUES
(121, 139, 64),
(122, 140, 64),
(125, 143, 67),
(126, 144, 67),
(127, 145, 67),
(128, 146, 67),
(129, 147, 67),
(130, 148, 67),
(131, 149, 67),
(132, 150, 67),
(133, 151, 67),
(134, 152, 68),
(135, 153, 68),
(136, 154, 68),
(137, 155, 68),
(138, 156, 68),
(139, 157, 68),
(140, 158, 68),
(141, 159, 68),
(142, 160, 68),
(143, 161, 68),
(144, 162, 68),
(145, 163, 68),
(146, 164, 68),
(147, 165, 68),
(148, 166, 68),
(149, 167, 38),
(150, 168, 38),
(151, 169, 38),
(152, 170, 38),
(153, 171, 38),
(154, 172, 38),
(155, 173, 38),
(156, 174, 38),
(157, 175, 38),
(158, 176, 38),
(159, 177, 38),
(160, 178, 38),
(161, 179, 38),
(162, 180, 38),
(163, 181, 38),
(164, 183, 5);

-- 
-- Вывод данных для таблицы lodges
--
INSERT INTO lodges VALUES
(7, 1, 1, 1, 15, 'В крайнем справа стуле торчит гвоздь', 285, 64, 46, 26, 2000000),
(8, 2, 1, 2, 10, 'Есть доп. табуретка', 304, 7, 38, 26, 2500000),
(9, 3, 1, 3, 10, 'На столе написано', 361, 20, 37, 27, 3000000),
(10, 4, 2, 1, 10, 'У этой ложи сиденье с подогревом', 436, 20, 37, 27, 3500000),
(11, 5, 2, 2, 15, 'В стоимость входит самовар с пивом', 505, 6, 46, 25, 3800000),
(12, 6, 3, 3, 15, 'Отсюда лучше всего виден сриптиз', 505, 62, 46, 25, 4000000),
(13, 0, 1, 4, 1, 'Пеший зал', 0, 0, 0, 0, 150000);

-- 
-- Вывод данных для таблицы orders
--
INSERT INTO orders VALUES
(1, '2012-04-27 17:28:42', '2012-04-20', 51, 7, 33, 1, 3000000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(2, '2012-04-27 17:28:44', '2012-04-20', 51, 8, 34, 2, 5500000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(3, '2012-04-27 17:28:46', '2012-04-20', 51, 9, 35, 3, 8000000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(4, '2012-04-27 17:28:52', '2012-04-20', 51, 10, 36, 1, 3000000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(5, '2012-05-05 16:11:01', '2012-04-20', 55, 10, 41, 1, 4000000, 150, 1, '2012-04-12 16:20:44', 4607046120141, NULL, 1),
(6, '2012-04-27 17:30:28', '2012-04-20', 55, 11, 19, 2, 6000000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(7, '2012-04-27 17:30:30', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(8, '2012-04-27 17:31:24', '2012-04-20', 43, 7, 91, 1, 3500000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(9, '2012-04-27 17:31:26', '2012-04-20', 43, 8, 92, 2, 5500000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(10, '2012-05-03 20:35:31', '2012-04-20', 43, 9, 93, 3, 7500000, 150, 1, '2012-04-12 16:20:44', 54491472, NULL, 1),
(11, '2012-04-27 17:32:25', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(12, '2012-05-03 21:08:56', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', 54881005906, NULL, 1),
(13, '2012-04-27 17:32:27', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(14, '2012-04-27 17:32:28', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(15, '2012-04-27 17:32:29', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(16, '2012-04-27 17:32:30', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(17, '2012-04-27 17:32:31', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(18, '2012-04-27 17:32:32', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(19, '2012-04-27 17:32:34', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(20, '2012-05-15 20:19:52', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-05-15 20:19:51', 4600068009043, NULL, 1),
(21, '2012-04-27 17:32:35', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(22, '2012-04-27 17:32:36', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(23, '2012-04-27 17:32:37', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(24, '2012-04-27 17:32:38', '2012-04-20', 55, 13, 42, 4, 200000, 150, 1, '2012-04-12 16:20:44', NULL, NULL, 1),
(35, '2012-05-17 20:58:47', '2010-04-20', 55, 9, 40, 3, 2000000, 150, 1, '2012-05-10 20:47:02', NULL, NULL, 7),
(38, '2012-05-17 20:58:50', '2010-04-20', 55, 12, 23, 3, 2000000, 150, 1, '2012-05-12 17:24:05', NULL, NULL, 7),
(41, '2012-05-17 20:58:52', '2011-04-20', 44, 8, 208, 2, 2500000, 200, 1, '2012-05-12 19:44:35', NULL, NULL, 7),
(42, '2012-05-17 20:58:53', '2011-04-20', 43, 13, 232, 4, 150000, 200, 1, '2012-05-12 19:52:16', NULL, NULL, 7),
(43, '2012-05-17 20:58:54', '2011-04-20', 43, 13, 232, 4, 150000, 200, 1, '2012-05-14 17:48:45', NULL, NULL, 7),
(44, '2012-05-17 20:58:55', '2010-04-20', 55, 7, 18, 1, 2000000, 150, 1, '2012-05-14 19:26:28', NULL, NULL, 7),
(45, '2012-05-17 20:58:56', '2010-04-20', 55, 13, 42, 4, 2000000, 150, 1, '2012-05-14 19:58:21', NULL, NULL, 7),
(46, '2012-05-17 20:58:57', '2011-04-20', 44, 13, 210, 4, 150000, 200, 1, '2012-05-14 20:02:25', NULL, NULL, 7),
(47, '2012-05-17 20:58:59', '2011-04-20', 44, 10, 211, 1, 3500000, 200, 1, '2012-05-14 20:02:59', NULL, NULL, 7),
(50, '2012-05-17 20:59:05', '2010-04-20', 64, 7, 77, 1, 2000000, 150, 1, '2012-05-14 20:05:36', NULL, NULL, 7),
(51, '2012-05-17 20:59:07', '2010-04-20', 64, 13, 78, 4, 2000000, 150, 1, '2012-05-14 20:07:41', NULL, NULL, 7),
(52, '2012-05-17 20:59:08', '2006-04-20', 65, 8, 219, 2, 2500000, 200, 1, '2012-05-14 20:09:55', NULL, NULL, 7),
(53, '2012-05-17 20:59:10', '2002-04-20', 67, 7, 49, 1, 2000000, 150, 1, '2012-05-14 20:11:00', NULL, NULL, 7),
(54, '2012-05-17 20:59:12', '2018-04-20', 63, 8, 188, 2, 2500000, 150, 1, '2012-05-14 20:17:20', NULL, NULL, 7),
(61, '2012-05-17 22:25:19', '2012-05-17', 63, 10, 189, 1, 14200000, 150, 1, '2012-05-17 22:25:17', NULL, NULL, 10),
(64, '2012-05-18 14:50:29', '2012-06-14', 71, 9, 249, 3, 3000000, 120, 1, '2012-05-18 14:50:27', NULL, NULL, 10),
(65, '2012-05-18 15:03:54', '2012-06-14', 71, 8, 244, 2, 2500000, 120, 1, '2012-05-18 15:03:52', NULL, NULL, 10),
(67, '2012-05-18 20:38:23', '2012-04-20', 43, 10, 233, 1, 3500000, 200, 1, '2012-05-18 20:38:21', NULL, NULL, 10),
(68, '2012-05-21 16:08:28', '2012-05-31', 67, 11, 32, 2, 2000000, 150, 1, '2012-05-21 16:08:25', NULL, NULL, 10),
(69, '2012-05-22 14:54:06', '2012-05-31', 67, 9, 31, 3, 2000000, 150, 1, '2012-05-22 14:54:04', NULL, NULL, 10),
(72, '2012-05-30 15:59:20', '2012-04-20', 43, 13, 232, 4, 150000, 200, 1, '2012-05-30 15:59:18', NULL, NULL, 7);

-- 
-- Вывод данных для таблицы phpfiles
--

-- Таблица promo.phpfiles не содержит данных

-- 
-- Вывод данных для таблицы pricelodges
--
INSERT INTO pricelodges VALUES
(1, 51, '2020-04-20', 1, 3000000),
(2, 51, '2012-04-20', 2, 5500000),
(3, 51, '2012-04-20', 3, 8000000),
(4, 51, '2012-04-20', 4, 150000),
(5, 55, '2012-04-20', 1, 4000000),
(6, 55, '2012-04-20', 2, 6000000),
(7, 55, '2012-04-20', 3, 9000000),
(8, 55, '2012-04-20', 4, 200000),
(9, 43, '2012-04-20', 1, 3500000),
(10, 43, '2012-04-20', 2, 5500000),
(11, 43, '2012-04-20', 3, 7500000),
(12, 43, '2012-04-20', 4, 180000);

-- 
-- Вывод данных для таблицы sys_acc_cli
--
INSERT INTO sys_acc_cli VALUES
(402, 'login6', 'admin', 1, '2013-09-09 21:26:20', 9),
(403, 'login6', 'admin', 0, '2013-09-09 21:26:24', 9),
(404, 'login6', 'manager', 1, '2013-09-09 21:26:27', 9),
(407, 'login4', 'admin', 0, '2013-09-17 19:05:35', 7),
(408, 'login4', 'admin', 1, '2013-09-17 19:05:38', 7),
(409, 'login3', 'manager', 1, '2013-09-17 16:29:03', 6),
(410, 'login2', 'cashier', 1, '2013-09-17 16:29:11', 5),
(411, 'login4', 'admin', 1, '2013-09-17 16:29:23', 7),
(412, 'login7', 'admin', 1, '2013-09-17 17:45:24', 10),
(414, 'login7', 'admin', 0, '2013-09-17 17:45:35', 10),
(415, 'login6', 'manager', 0, '2013-09-17 17:54:21', 9),
(416, 'login6', 'cashier', 1, '2013-09-17 17:54:29', 9),
(417, 'login7', 'manager', 1, '2013-09-17 17:54:33', 10),
(418, 'Denissimo', 'admin', 1, '2013-09-17 18:01:29', 3),
(419, 'login7', 'manager', 0, '2013-09-24 18:06:42', 10),
(420, 'login7', 'cashier', 1, '2013-09-24 18:06:49', 10),
(421, 'login6', 'cashier', 0, '2013-09-24 18:06:52', 9),
(422, 'login6', 'manager', 1, '2013-09-24 18:06:57', 9),
(423, 'login01', 'manager', 1, '2013-09-26 10:46:26', 4);

-- 
-- Вывод данных для таблицы sys_acclabels
--
INSERT INTO sys_acclabels VALUES
(2, 'manager', 'manager'),
(3, 'manager', 'manevadd'),
(4, 'manager', 'event'),
(5, 'cashier', 'cashier'),
(6, 'cashier', 'sale'),
(7, 'cashier', 'ajx_bar'),
(8, 'cashier', 'cash'),
(9, 'manager', 'manevedit'),
(12, 'cashier', 'test4');

-- 
-- Вывод данных для таблицы sys_accrank
--
INSERT INTO sys_accrank VALUES
(1, 'admin', 'Администратор'),
(2, 'manager', 'менеджер'),
(3, 'cashier', 'кассир');

-- 
-- Вывод данных для таблицы sys_actions
--
INSERT INTO sys_actions VALUES
(1, 'test04_x', 'bbig', 'add', 'POST', 'zztest', NULL, NULL, NULL, NULL),
(2, 'test04d_x', 'row_id', 'del', 'POST', 'zztest', NULL, NULL, NULL, ''),
(3, 'logout', 'logout', '', 'POST', 'sys_users', NULL, NULL, NULL, 'Логаут ОК'),
(4, 't222', '', 'add', 'POST', 'ztest', NULL, NULL, NULL, 'test2 всё в порядке'),
(5, 'loging', '', '', 'POST', 'sys_users', NULL, NULL, NULL, 'Логин ОК'),
(6, 'loginbut', '', '', 'POST', 'sys_users', NULL, NULL, NULL, 'Логин ОК'),
(7, 'delbut_x', '', 'del', 'POST', 'events', NULL, NULL, NULL, 'Мероприятие удалено'),
(8, 'edit_event_but_x', '', 'edit', 'POST', 'events', NULL, NULL, NULL, 'Изменения сохранены'),
(9, 'lodev_del_x', '', 'del', 'POST', 'link_event_lodge', NULL, NULL, NULL, 'Ложа откреплена'),
(10, 'lodev_add_x', '', 'add', 'POST', 'link_event_lodge', NULL, NULL, NULL, 'Ложа прикреплена'),
(11, 'adduser', '', 'add', 'POST', 'sys_users', NULL, NULL, NULL, 'Пользователь добавлен'),
(12, 'delbut_x', '', 'del', 'POST', 'events', NULL, NULL, NULL, 'Мероприятие удалено'),
(13, 'addevent', '', 'add', 'POST', 'events', NULL, NULL, NULL, 'Мероприятие добавлено'),
(14, 'edituser', '', 'edit', 'POST', 'sys_users', NULL, NULL, NULL, 'Пользователь изменён'),
(15, 'user_discard_x', '', 'add', 'POST', 'sys_acc_cli', NULL, NULL, NULL, 'Отставка ОК'),
(16, 'user_assign_x', '', 'add', 'POST', 'sys_acc_cli', NULL, NULL, NULL, 'Назначен'),
(17, 'user_delete_x', '', 'del', 'POST', 'sys_users', NULL, NULL, NULL, 'Пользователь удалён'),
(18, 'lodflo_del_x', '', 'del', 'POST', 'link_event_lodge', NULL, NULL, NULL, 'Ложи откреплены'),
(19, 'lodflo_add_x', '', 'put', 'POST', 'link_event_lodge', NULL, NULL, NULL, 'Ложи приреплены'),
(20, 'salecash', '', 'add', 'POST', 'orders', NULL, NULL, NULL, 'Продано'),
(21, 'ordel_x', '', 'del', 'POST', 'orders', NULL, NULL, NULL, 'Удалено'),
(22, 'cashon_x', '', 'edit', 'POST', 'devparam', NULL, NULL, NULL, 'включено'),
(23, 'cashoff_x', '', 'edit', 'POST', 'devparam', NULL, NULL, NULL, 'выключено'),
(24, 'chpu_add', '', 'add', 'POST', 'sys_chpu', NULL, NULL, NULL, 'добавлено'),
(25, 'chpu_del', '', 'del', 'POST', 'sys_chpu', NULL, NULL, NULL, 'Удалено'),
(26, 'chpu_edit', '', 'edit', 'POST', 'sys_chpu', NULL, NULL, NULL, 'Сохранено'),
(27, 'script_edit', '', 'edit', 'POST', 'sys_scripts', NULL, NULL, NULL, 'Сохранено'),
(28, 'script_add', '', 'add', 'POST', 'sys_scripts', NULL, NULL, NULL, 'Сохранено'),
(29, 'test01_x', '', 'del', 'POST', 'sdktestomni', 1, NULL, NULL, 'Прокатило'),
(30, 'test02_x', '', 'add', 'POST', 'sdktestomni', 1, NULL, NULL, 'Добавилось'),
(31, 'elrte', '', 'edit', 'POST', 'sys_scripts', NULL, NULL, NULL, ''),
(32, 'test004_x', '', 'add', 'POST', 'ztest', NULL, NULL, NULL, 'Миссия 1'),
(33, 'test004_x', '', 'add', 'POST', 'zztest', NULL, NULL, NULL, 'Миссия 2'),
(34, 'test005_x', '', 'add', 'POST', 'ztest', NULL, NULL, NULL, 'Миссия 3\t\t\t\t\t\t\t\r\n'),
(35, 'test005_x', '', 'add', 'POST', 'zztest', NULL, NULL, NULL, 'Миссия 4\t\t\t\t\t\t\t\r\n'),
(36, 'wysiwyg', '', 'edit', 'POST', 'sys_scripts', NULL, NULL, NULL, 'Вставка проведена'),
(37, 'test7', NULL, 'add', 'POST', 'zz_bukets', NULL, NULL, NULL, 'ПЫЩЬ'),
(38, 'putcom', NULL, 'php', '', '', NULL, NULL, 'postuserid', ''),
(39, 'putcom', NULL, 'add', 'POST', 'sys_comments', NULL, NULL, NULL, ''),
(40, 'logoutbut', 'logout', '', 'POST', 'sys_users', NULL, NULL, NULL, 'Логаут ОК'),
(41, 'putmes', NULL, 'php', '', '', NULL, NULL, 'postuserid', ''),
(42, 'putmes', NULL, 'add', 'POST', 'dat_forum_topics', NULL, NULL, NULL, 'Тема добавлена'),
(43, 'editcom', NULL, 'edit', 'POST', 'sys_comments', NULL, NULL, NULL, 'Изменено'),
(44, 'editmes', NULL, 'edit', 'POST', 'dat_forum_topics', NULL, NULL, NULL, 'Изменено'),
(45, 'edit_forum_cat', NULL, 'edit', 'POST', 'dat_forum_cats', NULL, NULL, NULL, 'Изменено'),
(46, 'new_forum_cat', NULL, 'add', 'POST', 'dat_forum_cats', NULL, NULL, NULL, 'Добавлено'),
(47, 'del_forum_cat', NULL, 'del', 'POST', 'dat_forum_cats', NULL, NULL, NULL, 'Удалено'),
(48, 'edit_forum_sub', NULL, 'edit', 'POST', 'dat_forum_subcat', NULL, NULL, NULL, 'Изменено'),
(49, 'del_forum_sub', NULL, 'del', 'POST', 'dat_forum_subcat', NULL, NULL, NULL, 'Удалено'),
(50, 'new_forum_sub', NULL, 'add', 'POST', 'dat_forum_subcat', NULL, NULL, NULL, 'Добавлено'),
(51, 'delmes', NULL, 'del', 'POST', 'dat_forum_topics', NULL, NULL, NULL, 'Удалено'),
(52, 'delcom', NULL, 'del', 'POST', 'sys_comments', NULL, NULL, NULL, 'Удалено'),
(53, 'loginouter', '', '', 'POST', '1:users', NULL, NULL, NULL, 'Новый Логин ОК');

-- 
-- Вывод данных для таблицы sys_catalog
--
INSERT INTO sys_catalog VALUES
(1, 'catal', NULL, 'catrus', 'zz_categ', 1, 'catrus', 'title', 'keywords', 'description', 'h1', NULL, 0, NULL),
(2, 'catal', NULL, 'catrus///cateng//', 'zz_categ', 6, '', 'title', 'keywords', 'description', 'h1', NULL, 0, NULL),
(3, 'catal', NULL, '/nameeng', 'zz_bukets', 2, 'consist', 'namerus', 'namerus', 'namerus', 'namerus', NULL, 0, NULL),
(4, 'catal', 'SELECT * FROM  zz_bukets LEFT JOIN zz_categ ON zz_bukets.categ=zz_categ.nam WHERE zz_categ.catrus="[0]" and zz_bukets.namerus="[1]"', NULL, 'zz_bukets', NULL, 'nameeng', 'namerus', 'namerus', 'namerus', 'namerus', '', 0, NULL);

-- 
-- Вывод данных для таблицы sys_cfg
--
INSERT INTO sys_cfg VALUES
(1, 'counter', 'counter', '144', NULL),
(2, 'basic', 'admuser', 'administrator', NULL),
(3, 'basic', 'admpass', '123123', NULL),
(4, 'system', 'loginoblig', '1', NULL),
(5, 'basic', 'usertable', 'clients', NULL),
(6, 'basic', 'userfield', 'login', NULL),
(7, 'system', 'matchcase', '1', NULL),
(8, 'system', 'encoding', 'utf-8', NULL),
(9, 'system', 'loginurl', 'login', NULL),
(10, 'patterns', 'content', '/[>([a-zA-Z0-9_-]+)<]/', NULL),
(11, 'system', 'maxlevels', '7', 'Max level of address for comments to link. '),
(12, 'system', 'twiggy', '0', 'Branched comments or not (not in work - branched only)'),
(13, 'system', 'commenttemp', 'main', 'name of comment template'),
(14, 'system', 'commentmaxlevel', '7', 'Maximal level of comments offset'),
(15, 'system', 'loginback', '1', 'Return back after login (1-yes, 0-no)'),
(16, 'system', 'loginbacklabel', '', 'Empty - go back. Or chpu label.'),
(17, 'basic', 'sess_prefix', NULL, 'Prefix of session variable names which won''t '),
(18, 'system', 'loginlabel', 'login', NULL),
(19, 'defaults', 'lastslash', '0', '0 - no slash at the end of url /address/ rewrites to /address\t\t\t\t\t\t\t\r\n1 - slash at the end of url /address rewrites to /address/\t\t\t\t\t\t\t\r\n'),
(20, 'defaults', 'datasource', 'mysql', 'Default database source (mysql/sqlite/amazon)'),
(21, 'forum', 'maxedittime', '86400', 'Time after which you woll not be able to edit message'),
(22, 'basic', 'allowtags', '<img><a><p><b><i><sub><sup><s><strike><br><blockquote><pre>', 'Tags allowed in the get/post data');

-- 
-- Вывод данных для таблицы sys_chpu
--
INSERT INTO sys_chpu VALUES
(1, '', 'main20130508', 'portal20130508', NULL, NULL, 'main', 1, '/', 'процессинговая система', '', 'процессинговая система', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 0, 1, 0, '', 0, NULL),
(2, 'data_data.php', NULL, 'plain', NULL, NULL, 'data', 1, 'data', 'обмен данными', '', 'Обмен данными', 'Ключевые слова страницыОбмен данными', 'Описание страницы Обмен данными', 0, 1, 0, 'Content-Type: text/plain; charset=utf-8', 0, NULL),
(3, 'data_test.php', ' ', 'main', NULL, NULL, 'test', 1, 'Тест', '', '', 'Тестовая страница', 'Ключевые слова страницы', 'Описание страницы ', 0, 1, 0, '', 1, NULL),
(4, 'data_test2.php', NULL, 'main', 'test8', NULL, 'test2', 2, 'Проба 2', '', '', 'Пробная страница №2', 'Ключевые слова страницыПробная страница №2', 'Описание страницы Пробная страница №2', 2, 1, 0, '', 0, NULL),
(5, 'data_test3.php', ' ', 'main', 'test9', NULL, 'test3', 2, 'Проба 3', '123', '', 'Проба №3', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 0, 1, 0, '', 0, NULL),
(6, 'data_manager.php', NULL, 'main', NULL, NULL, 'manager', 2, 'Менеджер', 'Рабочее место менеджера', '', 'Рабочее место менеджера', 'Ключевые слова страницыРабочее место менеджера', 'Описание страницы Рабочее место менеджера', 0, 2, 0, '', 0, NULL),
(7, 'data_manevlist.php', NULL, 'main', NULL, NULL, 'manevlist', 1, 'Менеджер/Список Мероприятий', '', '', 'Рабочее место менеджера - Список мероприятий', 'Ключевые слова страницыРабочее место менеджера - Список мероприятий', 'Описание страницы Рабочее место менеджера - Список мероприятий', 0, 1, 0, '', 0, NULL),
(8, 'data_post.php', NULL, 'plain', NULL, NULL, 'post', 1, 'post', '', '', 'Обработка POST переменных', 'Ключевые слова страницыОбработка POST переменных', 'Описание страницы Обработка POST переменных', 0, 1, 0, '', 0, NULL),
(9, 'data_manevadd.php', NULL, 'main', NULL, NULL, 'manevadd', 1, 'Менеджер/Добавить мероприятие', '', '', 'Рабочее место менеджера - Добавление мероприятий', 'Ключевые слова страницыРабочее место менеджера - Добавление мероприятий', 'Описание страницы Рабочее место менеджера - Добавление мероприятий', 0, 2, 0, '', 0, NULL),
(10, 'data_admin.php', NULL, 'main', NULL, NULL, 'admin', 1, 'Администратор/Назначения', '', '', 'Рабочее место администратора', 'Ключевые слова страницыРабочее место администратора', 'Описание страницы Рабочее место администратора', 0, 2, 0, '', 0, NULL),
(11, 'data_manevedit.php', NULL, 'main', NULL, NULL, 'manevedit', 1, 'Менеджер/Изменить мероприятие', '', '', 'Рабочее место менеджера - Изменение мероприятия', 'Ключевые слова страницыРабочее место менеджера - Изменение мероприятия', 'Описание страницы Рабочее место менеджера - Изменение мероприятия', 0, 2, 0, '', 0, NULL),
(12, 'data_login.php', ' ', 'portlog', NULL, NULL, 'login', 1, 'login', '', '', 'Молви друг и входи', 'Ключевые слова страницыМолви друг и входи', 'Описание страницы Молви друг и входи', 0, 1, 0, '', 0, NULL),
(13, 'data_event_lodge.php', NULL, 'main', NULL, NULL, 'event', 2, 'Мероприятие', '', '', 'Прикрепить ложи к мероприятию', 'Ключевые слова страницыПрикрепить ложи к мероприятию', 'Описание страницы Прикрепить ложи к мероприятию', 0, 2, 0, '', 0, NULL),
(14, 'data_admuseradd.php', NULL, 'main', NULL, NULL, 'admusadd', 1, 'Администратор/Добавить пользователя', '', '', 'Рабочее место администратора - Добавление пользователя', 'Ключевые слова страницыРабочее место администратора - Добавление пользователя', 'Описание страницы Рабочее место администратора - Добавление пользователя', 0, 2, 0, '', 0, NULL),
(15, 'data_admusedit.php', NULL, 'main', NULL, NULL, 'admusedit', 2, 'Пользователи', '', '', 'Рабочее место менеджера - Изменение пользователя', 'Ключевые слова страницыРабочее место менеджера - Изменение пользователя', 'Описание страницы Рабочее место менеджера - Изменение пользователя', 0, 2, 0, '', 0, NULL),
(23, 'data_adm.php', NULL, 'main', NULL, NULL, 'adm', 1, 'Администратор', '', '', 'Рабочее место администратора', 'Ключевые слова страницы Рабочее место администратора', 'Описание страницы Рабочее место администратора', 0, 2, 0, '', 0, NULL),
(25, 'data_engine.php', ' ', 'portal', NULL, NULL, 'engine', 2, 'engine', '', '', 'Движок', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 1, 2, 0, '', 0, NULL),
(46, 'data_chpuadd.php', ' ', 'main', NULL, NULL, 'chpuadd', 1, 'engine/add url', '', '', 'Добавление раздела', 'Ключевые слова страницы Добавление раздела', 'Описание страницы Добавление раздела', 0, 2, 0, '', 0, NULL),
(48, 'data_scriptedit.php', ' ', 'main', NULL, NULL, 'scriptedit', 2, 'scriptedit', NULL, NULL, 'Движок', 'Ключевые слова страницы Движок', 'Описание страницы Движок', NULL, 2, NULL, NULL, 0, NULL),
(49, 'data_scriptadd.php', ' ', 'main', NULL, NULL, 'scriptadd', 1, 'scriptadd', '123', NULL, 'Добавление скрипта', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 0, 2, NULL, '', 0, NULL),
(50, '', 'addpict', 'main', NULL, NULL, 'addpicture', 1, 'addpicture', '', '', 'Движок', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 0, 1, 0, '', 0, NULL),
(51, '', 'addpicproc', 'main', NULL, NULL, 'addpicproc', 1, 'addpicproc', '', '', 'обработка картинки', 'Ключевые слова страницы обработка картинки', 'Описание страницы обработка картинки', 0, 1, 0, '', 0, NULL),
(52, 'data_test_wiki.php', 'test', 'main', 'test8', NULL, 'wiki', 2, 'вики', '', '', 'Вики', 'Ключевые слова страницы Вики', 'Описание страницы Вики', 0, 1, 0, '', 0, NULL),
(53, 'data_catal.php', ' ', 'main', NULL, NULL, 'catal', 1, 'Каталог', '', '', 'Каталог', 'Ключевые слова страницы Каталог', 'Описание страницы Каталог', 0, 1, 0, '', 0, NULL),
(54, 'data_404.php', ' ', 'main', NULL, NULL, '404', 1, '404', '404', '', 'Движок', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 0, 1, 0, '', 0, NULL),
(55, 'amazon/data_amazon.php', NULL, 'main', NULL, NULL, 'amazon', 1, 'amaz', '', '', 'Amazon', 'Ключевые слова страницы Amazon', 'Описание страницы Amazon', 0, 1, 0, '', 0, NULL),
(56, 'data_test4.php', ' ', 'main', NULL, NULL, 'test4', 1, 'Проба 4', '321', '', 'Тест 4 ++', 'Ключевые слова тест 4', 'Описание страницы Движок', 0, 2, 0, '', 0, NULL),
(57, 'data_elrte.php', ' ', 'clrte', NULL, NULL, 'elrte', 2, 'редактор', NULL, NULL, 'Движок', 'Ключевые слова страницы Движок', 'Описание страницы Движок', NULL, 2, NULL, NULL, 0, NULL),
(60, 'data_xml.php', ' ', 'plain', NULL, NULL, 'test_xml', 1, 'test xml', 'Тест XML', '', 'Движок', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 0, 1, 0, 'Content-Type: text/xml\t\t\t\t\t\t\t\r\nLast-Modified: &quot;.gmdate(&quot;D, d M Y H:i:s&quot;).&quot; GMT\t\t\t\t\t\t\t\r\nCache-Control: no-cache, must-revalidate\t\t\t\t\t\t\t\r\nCache-Control: post-check=0,pre-check=0\t\t\t\t\t\t\t\r\nCache-Control: max-age=0\t\t\t\t\t\t\t\r\nPragma: no-cache', 0, NULL),
(61, 'test_redis.php', ' ', 'main', NULL, NULL, 'test_redis', 1, 'test redis', 'Тест Redis', '', 'Redis', 'Ключевые слова страницы Движок', 'Описание страницы Redis', 0, 1, 0, '', 0, NULL),
(62, '', 'phpinfo', 'main', NULL, NULL, 'phpinfo', 1, 'php info', '', '', 'Движок', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 0, 1, 0, '', 0, NULL),
(63, '', 'blitz', 'main', NULL, NULL, 'blitz', 1, 'blitzz', 'Blitz', '', 'Движок', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 0, 1, 0, '', 0, NULL),
(64, '', 'pagintest', 'main', NULL, NULL, 'pagin', 2, 'Проба пагинатора', '', NULL, 'Пагинатор', 'Ключевые слова страницы Движок', 'Описание страницы Движок', 1, 1, NULL, '', 0, NULL),
(65, 'test_sqlite.php', '', 'main', NULL, NULL, 'sqlite', 1, 'test sqlite', '', NULL, 'SQLite', 'Ключевые слова страницы Добавление раздела', 'Описание страницы Добавление раздела', NULL, 1, NULL, '', 0, NULL),
(66, 'data_wysiwyg.php', ' ', 'portal', NULL, NULL, 'wysiwyg', 2, 'wysiwyg', NULL, NULL, 'Редактор', 'Редактор', 'Редактор', 1, 2, NULL, NULL, 0, 1),
(70, 'php/php_ckupload.php', ' ', 'plain', NULL, NULL, 'ckupload', 1, 'ckupload', NULL, NULL, 'upload', 'Ключевые слова страницы upload', 'Описание страницы upload', 0, 1, NULL, NULL, 0, 1),
(71, 'php/php_ckbrowse.php', ' ', 'simple', NULL, NULL, 'ckbrowse', 1, 'ckbrowse', '', NULL, 'ckbrowse', 'Ключевые слова страницы ckbrowse', 'Описание страницы ckbrowse', 0, 1, NULL, '', 0, NULL),
(72, '/kcfinder/browse.php', '', 'plain', NULL, NULL, 'filebrowser', 1, 'filebrowser', '', NULL, '', '', '', NULL, 1, NULL, '', 0, NULL),
(73, 'data_test7.php', ' ', 'portal20130911', NULL, NULL, 'test7', 2, 'Проба 7', '', NULL, 'Дежурные пробы на разные темы', 'Ключевые слова страницы Добавление раздела', 'Описание страницы Добавление раздела', 0, 1, NULL, '', 2, NULL),
(74, '', 'dyatpear', 'plain', NULL, NULL, 'dyatpear', 1, 'dyatpear', '', NULL, '', '', '', 0, 1, NULL, 'Content-Type: image/png', 0, NULL),
(77, '', ' ', 'test', NULL, NULL, 'profile', 2, 'Профиль', '', NULL, 'Личное дело Штирлица Отто фон', 'Ключевики профайла', 'Профайл юзера', 0, 1, NULL, '', 0, NULL),
(78, 'php/php_tinymce.php', ' ', 'portal', NULL, NULL, 'tinymce', 2, 'edithtml', '', NULL, 'Редактор', 'Редактор', 'Редактор', 1, 2, NULL, '', 0, NULL),
(79, 'data_test8.php', ' ', 'main', NULL, NULL, 'test8', 1, 'Проба 8', '', NULL, 'Проба 8', 'Проба 8', 'Проба 8', 0, 1, NULL, '', 1, NULL),
(80, 'data_test9.php', ' ', 'main', 'test8', NULL, 'test9', 1, 'Проба 9', '', NULL, 'Проба 9', 'Проба 9', 'Проба 9', 0, 1, NULL, '', 1, 1),
(81, 'data_test10.php', ' ', 'main', 'test9', NULL, 'test10', 1, 'Проба 10', '', NULL, 'Проба 10', 'Проба 10', 'Проба 10', 0, 1, NULL, '', 1, NULL),
(82, 'data_test_partial.php', ' ', 'main', 'test10', NULL, 'testpartial', 1, 'Проба Partial', '', NULL, 'Проба Partial', 'Проба Partial', 'Проба Partial', 0, 1, NULL, '', 1, NULL),
(84, '', 'tesst', 'main', 'test11', 1, 'test89', 1, 'Проба 8/Проба 0', '', NULL, 'Проба 8-9', 'Проба 8-9', 'Проба 8-9', 0, 1, NULL, '', 1, 0),
(85, '', 'testecho', 'plain', NULL, NULL, 'testecho', 1, 'testecho', '', NULL, 'Проба echo', 'Проба echo', 'Проба echo', 0, 1, NULL, '''Content-Type: text/html; charset=utf-8', 0, NULL),
(86, '', 'tesst', 'main', 'test8', NULL, 'testhtm', 1, 'file.html', '', NULL, 'Test html', 'Test html', 'Test html', 0, 1, NULL, '', 0, NULL),
(87, 'omni_forum.php', NULL, 'portal20130911', NULL, NULL, 'omniforum', 2, 'forum', NULL, NULL, 'Форум омникомм', 'ключевые слова главной страницы форума омникомм', 'Описание', NULL, 1, NULL, NULL, 4, NULL),
(88, 'php/php_editmes.php', '', 'portal20130911', NULL, NULL, 'editmes', 2, 'editmes', '', NULL, 'Правка', 'Правка', 'Правка', NULL, 1, NULL, '', 0, NULL),
(89, 'php/php_forumcats.php', ' ', 'portal20130911', '', NULL, 'forum_cats', 1, 'categories', '', NULL, 'Категории форума', 'Категории форума', 'Категории форума', 0, 2, NULL, '', 0, NULL),
(90, 'php/php_forumsubs.php', ' ', 'portal20130911', '', NULL, 'forum_subs', 2, 'subcats', '', NULL, 'Подразделы', 'Подразделы', 'Подразделы', 0, 2, NULL, '', 0, NULL),
(91, 'data_post.php', NULL, 'plain', NULL, NULL, 'forumpost', 1, 'forum/post', '', '', 'Обработка POST переменных', 'Ключевые слова страницыОбработка POST переменных', 'Описание страницы Обработка POST переменных', 0, 1, 0, '', 0, NULL);

-- 
-- Вывод данных для таблицы sys_chpu2
--
INSERT INTO sys_chpu2 VALUES
(4, 'test8', NULL, 'test2'),
(5, 'test9', NULL, 'test3'),
(73, NULL, NULL, 'test7'),
(79, NULL, NULL, 'test8'),
(80, 'test8', NULL, 'test9'),
(81, 'test9', 1, 'test10');

-- 
-- Вывод данных для таблицы sys_comments
--
INSERT INTO sys_comments VALUES
(1, 'test', 0, '', 7, NULL, 2, NULL, 'rhsdfhdfh', 'ouig9ggu80', '2013-09-13 20:20:16'),
(2, 'omniforum', 0, '1', 7, NULL, 2, NULL, 'Роджер Желязны. Хроники Амбера', ' И мы  поехали. Мы понеслись по  каньону среди  скал, затем очутились  в городе,   который,   казалось,   был   сделан  полностью   из   стекла   или стеклозаменителя,  с  высокими зданиями, хрупкими  и непрочными на вид,  и с людьми, на которых светило розовое солнце, высвечивая их внутренние органы и\t\t\t\t\t\t\t\r\nостатки их недавних  обедов. Когда мы  проезжали мимо, они останавливались и глазели  на  нас. Они  собирались  на  углах  улиц  толпами,  но  ни один не попытался задержать нас или перейти дорогу перед нашей машиной.\t\t\t\t\t\t\t\r\n     --  Жители   этого  города,  несомненно,  будут  рассказывать  об  этом происшествии долгие годы, -- заметил Рэндом.\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n+++', '2013-09-13 20:21:40'),
(3, 'omniforum', 0, '1', 7, NULL, 2, NULL, 'Путешествия по отражениям', ' Затем дорога  кончилась и  мы  поехали по поверхности, которая казалась нескончаемым  листом  силикона. Через  некоторое  время он сузился  и  вновь перешел  в  нашу  дорогу,  а потом справа  и слева от  нас появились болота:\t\t\t\t\t\t\t\r\nнизколежащие, коричневые по  цвету и вонючие. В одном из них я увидел  --  в этом  я мог  бы поклясться --  диплодока,  который поднял голову  и довольно неодобрительно глядел на нас.\t\t\t\t\t\t\t\r\n', '2013-09-13 20:21:40'),
(4, 'omniforum', 0, '1', 7, NULL, 2, NULL, NULL, ' Мили через три мы под''ехали к какой-то баррикаде из стесанных бревен, и я начал об''езжать ее. С одной ее стороны были ворота, и Рэндом сказал мне:\t\t\t\t\t\t\t\r\n     -- Остановись и посигналь.\t\t\t\t\t\t\t\r\n     Я так и сделал, и через некоторое  время деревянные ворота распахнулись вовнутрь.\t\t\t\t\t\t\t\r\n     -- В''езжай смело, опасности нет, -- сказал он.\t\t\t\t\t\t\t\r\n     Я в''ехал,  и слева от себя увидел три колонки  с бензином, а неподалеку --  маленькое здание,  какие  я  тысячами видел  раньше при более ординарных обстоятельствах.  Я  под''ехал  к  одной из  колонок  и стал  ждать. Человек,\t\t\t\t\t\t\t\r\nвышедший из домика, был около пяти футов ростом, как пивная бочка в обхвате, с похожим на клубниченку носом и шириной плеч как минимум в ярд.\t\t\t\t\t\t\t\r\n     -- Что угодно? -- спросил он. -- Заправить бак?\t\t\t\t\t\t\t\r\n     -- Просто бензин, -- ответил я.\t\t\t\t\t\t\t\r\n     -- Подвиньте немного машину, -- он указал, куда.\t\t\t\t\t\t\t\r\n     Я пододвинул машину и спросил Рэндома:\t\t\t\t\t\t\t\r\n     -- А мои деньги здесь годятся?\t\t\t\t\t\t\t\r\n     -- А ты посмотри на них.\t\t\t\t\t\t\t\r\n     Я открыл  бумажник.  Он был  туго набит оранжевыми и желтыми купюрами с римскими цифрами на углах и инициалами "Д.Р."\t\t\t\t\t\t\t\r\n     Он ухмыльнулся, глядя, как я разглядываю купюры.\t\t\t\t\t\t\t\r\n     -- Вот видишь, я позаботился обо всем.\t\t\t\t\t\t\t\r\n     -- Ну и чудо. Между прочим, я проголодался.\t\t\t\t\t\t\t\r\n     Мы  стали оглядываться  вокруг  и  увидели  рекламу  человека,  который подавал кентуккийского цыпленка-гриль совсем рядом. Реклама горела неоном. Земляничный  нос пошаркал  ногой по  какому-то бугорку  на земле, чтобы сравнять его, повесил брезентовый шланг, подошел к нам и сказал:\t\t\t\t\t\t\t\r\n     -- Восемь Драхм Регумз.', '2013-09-13 20:21:40'),
(5, 'omniforum', 3, '1', 7, NULL, 3, NULL, NULL, 'И  каменистая  поверхность стала  превращаться  в  отдельные булыжники, когда мы ехали по ней. Под булыжниками проглядывала обнаженная черная земля. Еще через несколько минут я увидел островки зелени. Сначала их было немного, но  трава  была  ярко-ярко  зеленой, такой  я ее никогда не видел  на Земле,\t\t\t\t\t\t\t\r\nкоторую  я знал.  Скоро  травы стало больше. Через некоторое время на  нашем пути стали попадаться отдельные деревья. Затем лес. Но что за лес!<br />\t\t\t\t\t\t\t\r\n     Я никогда еще не видел таких деревьев, могущественных и величественных, глубокого  богатого  зеленого  цвета с  крапинками золота.  Они возвышались, подавляли. Это  были огромные  сосны, дубы, клены  и много других  деревьев,\t\t\t\t\t\t\t\r\nназваний которых я не знал. В них шелестел ветерок с фантастически приятным, нежным запахом, который так и обвевал меня, когда я опустил окно.<br />\t\t\t\t\t\t\t\r\n     --  Арденнский  Лес, -- сказал человек, который был  моим  братом, и  я знал,  что он меня не обманывает, и я одновременно  и любил его, и завидовал ему в его мудрости и знаниях, которых лишился.<br />', '2013-09-13 20:21:40'),
(6, 'omniforum', 5, '1', 7, NULL, 2, NULL, NULL, 'jk;b;ji;', '2013-09-13 20:21:40'),
(7, 'omniforum', 6, '1', 7, NULL, 2, NULL, NULL, 'oiuugofyuiof', '2013-09-13 20:21:40'),
(8, 'omniforum', 7, '1', 7, NULL, 2, NULL, NULL, 'iugv79fvvt79', '2013-09-13 20:21:40'),
(9, 'omniforum', 8, '1', 7, NULL, 2, NULL, NULL, '97yf79tfvcv97fv', '2013-09-13 20:21:40'),
(10, 'omniforum', 9, '1', 7, NULL, 2, NULL, NULL, '97799fv79v  9 b ', '2013-09-13 20:21:40'),
(11, 'omniforum', 10, '1', 7, NULL, 2, NULL, NULL, '9yg 790  7 v9 y 90 ', '2013-09-13 20:21:40'),
(12, 'omniforum', 11, '1', 7, NULL, 2, NULL, NULL, '98yg890 90g 9', '2013-09-13 20:21:40'),
(13, 'omniforum', 6, '1', 7, NULL, 2, NULL, NULL, '9yg 790  7 v9 y 90 ', '2013-09-13 20:21:40'),
(14, 'omniforum', 13, '1', 7, NULL, 2, NULL, NULL, '98yg890 90g 9', '2013-09-13 20:21:40'),
(15, 'omniforum', 12, '1', 7, NULL, 2, NULL, NULL, '11111111111111', '2013-09-13 20:21:40'),
(39, 'omniforum', 4, '1', 7, NULL, 3, NULL, NULL, 'asdf\t\t\t\t\t\t\t\r\nфыва', '2013-09-13 20:21:40'),
(40, 'omniforum', 39, '1', 7, NULL, 2, NULL, NULL, '123\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n123', '2013-09-13 20:21:40'),
(41, 'omniforum', 40, '1', 7, NULL, 2, NULL, NULL, '000\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n987', '2013-09-13 20:21:40'),
(42, 'omniforum', 41, '1', 7, NULL, 3, NULL, NULL, '321\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br />321', '2013-09-13 20:21:40'),
(48, 'omniforum', 40, '1', 7, NULL, 3, NULL, NULL, '123\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br />654', '2013-09-13 20:21:40'),
(49, 'omniforum', 42, '1', 7, NULL, 3, NULL, 'репакуку', 'Мили через три мы под''ехали к какой-то баррикаде из стесанных бревен, и я начал об''езжать ее. С одной ее стороны были ворота, и Рэндом сказал мне: -- Остановись и посигналь. Я так и сделал, и через некоторое время деревянные ворота распахнулись вовнутрь. -- В''езжай смело, опасности нет, -- сказал он. Я в''ехал, и слева от себя увидел три колонки с бензином, а неподалеку -- маленькое здание, какие я тысячами видел раньше при более ординарных обстоятельствах. Я под''ехал к одной из колонок и стал ждать. Человек, вышедший из домика, был около пяти футов ростом, как пивная бочка в обхвате, с похожим на клубниченку носом и шириной плеч как минимум в ярд. -- Что угодно? -- спросил он. -- Заправить бак? -- Просто бензин, -- ответил я. -- Подвиньте немного машину, -- он указал, куда. Я пододвинул машину и спросил Рэндома: -- А мои деньги здесь годятся? -- А ты посмотри на них. Я открыл бумажник. Он был туго набит оранжевыми и желтыми купюрами с римскими цифрами на углах и инициалами "Д.Р." Он ухмыльнулся, глядя, как я разглядываю купюры. -- Вот видишь, я позаботился обо всем. -- Ну и чудо. Между прочим, я проголодался. Мы стали оглядываться вокруг и увидели рекламу человека, который подавал кентуккийского цыпленка-гриль совсем рядом. Реклама горела неоном. Земляничный нос пошаркал ногой по какому-то бугорку на земле, чтобы сравнять его, повесил брезентовый шланг, подошел к нам и сказал: -- Восемь Драхм Регумз.', '2013-09-13 20:21:40'),
(50, 'omniforum', 49, '1', 7, NULL, 2, NULL, NULL, '123', '2013-09-13 20:21:40'),
(51, 'omniforum', 48, '1', 7, NULL, 2, NULL, NULL, 'фывапролджэ', '2013-09-13 20:21:40'),
(52, 'omniforum', 48, '1', 7, NULL, 2, NULL, NULL, 'фывапролджэ', '2013-09-13 20:21:40'),
(53, 'omniforum', 48, '1', 7, NULL, 2, NULL, NULL, 'фывапролджэ', '2013-09-13 20:21:40'),
(54, 'omniforum', 48, '1', 7, NULL, 2, NULL, NULL, 'фывапролджэ', '2013-09-13 20:21:40'),
(55, 'omniforum', 48, '1', 7, NULL, 2, NULL, NULL, 'фывапролджэ', '2013-09-13 20:21:40'),
(58, 'omniforum', 0, '1', 7, NULL, 3, NULL, NULL, 'TESST', '2013-09-13 20:21:40'),
(59, 'omniforum', 54, '1', 7, NULL, 3, NULL, NULL, '11111111111111111', '2013-09-13 20:21:40'),
(60, 'omniforum', 6, '1', 7, NULL, 3, NULL, 'Рассказ с Лепры', 'Легкие жгло, словно я вдыхал пламя, и пот заливал глаза, но я не останавливался ни на секунду. Ботинки вязли в грязи подлеска, и каждый шаг становился всё труднее, как будто каждую секунду кто–то невидимый навешивал на мои ноги новые и новые гирьки. Но остановиться и перевести дух было нельзя. Я чувствовал, что боевики дышат в затылок, иногда даже слышал, как они перекрикиваются на своём поганом гортанном наречии. \t\t\t\t\t\t\t\r\nЭто длилось уже четвёртый час. Как загнанный собаками зверь, я носился по лесу в поисках форпоста, а эти твари сворой собак висели у меня на хвосте, и висели так прочно, как будто на мне висел радиомаяк, а у них в руках был пеленгатор. Навигатор разрядился, небо было плотно затянуто облачной пеленой, ни ЛЭП ни каких–либо строений я за всё это время не встретил. Мох с северной стороны деревьев – вот и все ориентиры. А форпост словно провалился сквозь землю. Я давно уже не имел чёткого представления, где я – лес был бесконечен как сибирская тайга – но что–то подсказывало: форпост там, впереди. Ещё немного и я добегу до наших. На форпосте дежурят от пяти до двенадцати бойцов, но это не важно. Даже если их только пятеро. Даже если они салаги–первогодки. С пятью вооружёнными подопечными, а главное, с боеприпасами, я мигом превращу эту толпу овцеёбов из охотников в дичь.\t\t\t\t\t\t\t\r\n«Калаш» болтался за спиной бесполезным грузом. Что ж, если поймают, умирать будет не так обидно. Как минимум, четверых чурок я отправил к их любимому Аллаху. Быть может, последняя длинная очередь, выпущенная мной в кусты, задела ещё одного или двух. Очень хочется на это надеяться, очень. Но один патрон оставить, наверное, стоило. Если поймают, о пуле можно будет только мечтать. В лучшем случае, мне отрежут голову. Они верят, что душе человека с отрезанной головой путь к Аллаху заказан. В худшем, со мной будут развлекаться, пока я не сдохну от болевого шока или потери крови. Поэтому, бесполезную каску и кевлар я давно выкинул на бегу. Преследователи давно поняли, что патронов у меня нет, и брать будут живым. \t\t\t\t\t\t\t\r\nЕщё есть бутылка с зажигательной смесью. На кой чёрт она мне, я не знал. Нам, федералам они ни к чему, это боевики любят швырять их в танки и БТРы. Разве что разбить об голову первого, кто меня догонит, превратив его в живой факел. Но я, почему–то, потратил бесценную секунду, чтобы снять её с тела боевика. В тот момент, когда я выпустил в кусты последний патрон, сзади раздался вопль и бородатый детина бросился на меня с кинжалом. Патроны у него, наверное, тоже кончились. Тупица заорал. Накинулся бы молча – мой труп уже глодали бы шакалы. Я перехватил его руку, перекинул бородача через себя и воткнул кинжал, сжатый в его руке, ему же в брюхо. Потом снял с его пояса бутылку и метнулся в кусты, стараясь увернуться от пуль. С тех пор я не остановился ни на секунду и бежал, несмотря на то, что уже темнело в глазах и ноги подкашивались.\t\t\t\t\t\t\t\r\nГрязь под ногами становилась всё жиже, и вскоре я добежал до протоки. Ручей шириной метра четыре и глубиной по щиколотку. Забежав в ручей, я рухнул, погрузив лицо в живительную влагу, и пил, пил, пил, пока не почувствовал, что вот–вот захлебнусь. Я отдышался и стал пить снова. Гортанных выкриков пока не слышно, а значит можно потратить полминуты на то, чтобы перевести дух. Мой «эскорт» наверняка измотан не меньше меня и потратит у ручья больше времени.\t\t\t\t\t\t\t\r\nРучей помогает сбить со следа. Собак у моих врагов не было, иначе они мигом бы меня догнали и порвали в клочья. Но кто знает, эти чучмеки первобытнее нас, ближе к природе, может они действительно чуют меня как волки? Иначе как понять, что я, тренированный офицер, столько времени не могу от них оторваться? Что ж, бережёного Бог бережёт. Попытаюсь сбить их со следа как охотничьих псов.\t\t\t\t\t\t\t\r\nЯ поднялся и побежал вниз по течению ручья, придерживаясь его середины. Минут через пять я решил, что отбежал достаточно далеко по воде и пора сворачивать в чащу. Я наклонился к воде, чтобы напоследок ещё раз напиться и вдруг увидел сквозь заросли папоротника машину. За кустами виднелся зад раскрашенного в камуфляж «Уазика».\t\t\t\t\t\t\t\r\nСлава Богу, Типичный федеральный «Уазик». Значит, форпост рядом. Надо предупредить, что боевики на хвосте и разжиться патронами. Зря я чтоли носился по лесу с тяжелым «Калашниковым»?\t\t\t\t\t\t\t\r\nЯ выскочил из кустов на поляну, где стояла машина, и уже подбегая к ней, понял, что тут что–то не так. Ни в машине, ни рядом с ней никого не было. «Уазик» был старый, снизу проеденный ржавчиной до дыр, спущенные колёса намертво утонули в грязи, сквозь мутные стёкла почти ничего не было видно. В приоткрытой дверце успел прорасти какой–то кустик. Сразу было видно, что стоит он тут не первый год.\t\t\t\t\t\t\t\r\nКак он попал сюда? Ни дороги, ни даже тропы оленьей не было видно. Вокруг был прежний тёмный лес. Внезапно меня охватила досада. Какая разница, откуда тут этот дурацкий вездеход? Сбросили его с вертолёта или принесли сюда инопланетяне… Я уже успел почувствовать себя спасённым. Я уже предвкушал, как мы погоним обратно овцеёбов, и прикончим их, измотанных одного за другим. И вдруг я снова остался безоружный, один на один с догоняющей меня бандой. В порыве гнева я сорвал с пояса бутылку и, размахнувшись, швырнул её в машину. Пламя, охватившее старую развалюху, взметнулось вверх, и отбросило подступавшие сумерки. \t\t\t\t\t\t\t\r\nЭто конец, подумал я. Если они и потеряли мой след, то теперь я своими руками любезно включил такой мощный маяк. Или ещё не конец? Они уже не будут искать меня, прочесывая лес шеренгой, они все разом ломанутся на огонёк. Если пойти не от них, а к ним, то главное первым заметить их и успеть спрятаться. Их внимание будет сосредоточено на поляне с горящей машиной, а я смогу ускользнуть…\t\t\t\t\t\t\t\r\nСбоку в кустах раздался треск веток. Я аж подпрыгнул на месте, вскинув бесполезный автомат. Из кустов раздался такой мощный рык, что у меня, потомка древесных приматов, пробежал в груди холодок. Кто опаснее, банда вооружённых боевиков или голодный медведь, я выяснять не стал, и, стараясь не шуметь, юркнул в кусты.\t\t\t\t\t\t\t\r\nФорпост я нашёл уже глубокой ночью. Искать бандитов самим было уже бесполезно, мы сообщили по рации координаты и с вертолётов сбросили спецгруппу с прицелами ночного видения и инфракрасными поисковыми датчиками. Нам сообщили позже, что боевиков положили всех до единого, никто не ушел.\t\t\t\t\t\t\t\r\nКогда я думаю обо всей этой истории, мне вспоминаются не стеклянные глаза мальчика ефрейтора из моей группы, попавшего под огонь бандитов первым и не кровавая струйка изо рта бородача, чей живот я проткнул его же кинжалом. \t\t\t\t\t\t\t\r\nМне вспоминается медведь. Убегая с поляны, я успел увидеть, как он, нимало не пугаясь огня, вразвалку подошёл к горящей машине. \t\t\t\t\t\t\t\r\nЧто с ним было дальше? Этот вопрос мучает меня уже много лет. Боюсь, что этого мне уже никогда не узнать.', '2013-09-16 17:33:44'),
(61, 'omniforum', 58, '1', 7, NULL, 2, NULL, NULL, '222222222222222222222', '2013-09-16 14:55:50'),
(62, 'omniforum', 58, '1', 7, NULL, 2, NULL, NULL, '3333333333333', '2013-09-16 16:36:18'),
(63, 'omniforum', 58, '1', 7, NULL, 2, NULL, NULL, '1213', '2013-09-13 20:34:10'),
(64, 'omniforum', 58, '1', 7, NULL, 2, NULL, NULL, '1213', '2013-09-13 20:36:33'),
(65, 'omniforum', 64, '1', 7, NULL, 3, NULL, NULL, 'фывайцукячсми', '2013-09-13 20:44:30'),
(66, 'omniforum', 65, '1', 7, NULL, 2, NULL, NULL, 'щдолпщдп', '2013-09-13 20:51:04'),
(67, 'omniforum', 0, '1', 7, NULL, 3, NULL, NULL, 'TEST BASIC', '2013-09-16 18:48:44'),
(68, 'omniforum', 0, '3', 5, NULL, 0, NULL, '+++++++++', '<p><sub><strike>qqqqqqqqqqqqqqqq</strike></sub></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>&nbsp;</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><sub><strike><img alt="" src="/images/1369824703_РґРµРЅРёСЃ.jpg" style="width: 600px; height: 400px;" /></strike></sub></p>\t\t\t\t\t\t\t\r\n', '2013-09-16 19:16:54'),
(69, 'omniforum', 0, '3', 7, NULL, 2, NULL, NULL, 'asdfas', '2013-09-16 20:06:17'),
(70, 'omniforum', 68, '3', 7, NULL, 2, NULL, '555', 'проба', '2013-09-16 20:08:11'),
(71, 'omniforum', 0, '3', 7, NULL, 2, NULL, 'хэдмесс', 'фывкапыапыва\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<img src="http://www.dostavka-buketov.ru/imag/df147.jpg" title="" >', '2013-09-16 20:11:44'),
(72, 'omniforum', 71, '3', 7, NULL, 2, NULL, '1111111', '2222222222', '2013-09-16 20:12:47'),
(73, 'omniforum', 0, '2', 8, NULL, NULL, NULL, 'Заголовок 3', 'ioufg99779f76fg', '2013-09-16 22:17:26'),
(74, 'omniforum', 9, '1', 8, NULL, NULL, NULL, 'яячспимяпи', '97yf79tfvcv97fv\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\nяяяяяяяяяяяяяяяяяяяяя', '2013-09-16 23:35:31'),
(75, 'omniforum', 72, '3', 7, NULL, 3, NULL, 'Тема сообщения:', '2222222222\t\t\t\t\t\t\t\r\n<br />lkgblvb', '2013-09-17 16:12:43'),
(76, 'omniforum', 67, '1', 7, NULL, 2, NULL, 'Тема сообщения:', 'zsdg', '2013-09-18 12:36:28'),
(77, 'omniforum', 67, '1', 7, NULL, 2, NULL, 'Тема сообщения:', 'zsdg', '2013-09-18 12:41:17'),
(78, 'omniforum', 0, '1', 7, NULL, 3, NULL, 'Тема сообщения:', 'Имхонет — это не только каталог фильмов, книг и игр, но и отзывы, советы, рецензии, а главное — персональные рекомендации, основанные на ваших собственных оценках. Вы сможете без труда подобрать то, что вам нужно, и скачать фильм, книгу или игру, а также посмотреть фильм онлайн прямо на сайте. Присоединяйтесь сейчас к 1 824 510 уже зарегистрированным пользователям!', '2013-09-18 12:42:39'),
(79, 'omniforum', 78, '1', 7, NULL, 2, NULL, 'Тема сообщения:', '<p>zxcvbz 33333333333333</p>\t\t\t\t\t\t\t\r\n', '2013-09-18 12:43:10'),
(80, 'omniforum', 59, '1', 7, NULL, 2, NULL, 'Тема сообщения:', '11111111111111111\t\t\t\t\t\t\t\r\n<br />33333333333333', '2013-09-18 12:43:30'),
(81, 'omniforum', 75, '3', 7, NULL, 2, NULL, '654', 'dfsdfhbsdgh', '2013-09-18 19:44:43'),
(82, 'omniforum', 3, '3', 7, NULL, 2, NULL, 'Тема сообщения:', 'И каменистая поверхность стала превращаться в отдельные булыжники, когда мы ехали по ней. Под булыжниками проглядывала обнаженная черная земля. Еще через несколько минут я увидел островки зелени. Сначала их было немного, но трава была ярко-ярко зеленой, такой я ее никогда не видел на Земле.\t\t\t\t\t\t\t\r\n<br />', '2013-09-18 19:55:52'),
(83, 'omniforum', 3, '3', 7, NULL, 3, NULL, '11111111111111', 'И каменистая поверхность стала превращаться в отдельные булыжники, когда мы ехали по ней. Под булыжниками проглядывала обнаженная черная земля. Еще через несколько минут я увидел островки зелени. Сначала их было немного, но трава была ярко-ярко зеленой, такой я ее никогда не видел на Земле.\t\t\t\t\t\t\t\r\n<br />', '2013-09-18 19:56:35'),
(84, 'omniforum', 81, '3', 7, NULL, 2, NULL, '11111111111', 'dfsdfhbsdgh', '2013-09-18 20:00:39'),
(85, 'omniforum', 0, '3', 7, NULL, 2, NULL, '44', '3333333333333333', '2013-09-18 20:01:20'),
(86, 'omniforum', 3, '3', 7, NULL, 3, NULL, '00000000000000', 'И каменистая поверхность стала превращаться в отдельные булыжники, когда мы ехали по ней. Под булыжниками проглядывала обнаженная черная земля. Еще через несколько минут я увидел островки зелени. Сначала их было немного, но трава была ярко-ярко зеленой, такой я ее никогда не видел на Земле.\t\t\t\t\t\t\t\r\n<br />', '2013-09-18 20:05:25'),
(87, 'omniforum', 3, '3', 7, NULL, 2, NULL, '00', 'И каменистая поверхность стала превращаться в отдельные булыжники, когда мы ехали по ней. Под булыжниками проглядывала обнаженная черная земля. Еще через несколько минут я увидел островки зелени. Сначала их было немного, но трава была ярко-ярко зеленой, такой я ее никогда не видел на Земле.\t\t\t\t\t\t\t\r\n<br />', '2013-09-18 20:06:23'),
(88, 'omniforum', 0, '3', 7, NULL, 2, NULL, '111', '222', '2013-09-18 20:10:56'),
(89, 'omniforum', 0, '3', 7, NULL, 3, NULL, '111111', '11111111', '2013-09-18 20:11:54'),
(90, 'omniforum', 0, '3', 7, NULL, 2, NULL, '22222222222', 'И каменистая поверхность стала превращаться в отдельные булыжники, когда мы ехали по ней. Под булыжниками проглядывала обнаженная черная земля. Еще через несколько минут я увидел островки зелени. Сначала их было немного, но трава была ярко-\t\t\t\t\t\t\t\r\n', '2013-09-18 20:12:06'),
(91, 'omniforum', 75, '3', 7, NULL, 2, NULL, '11111111111', '2222222222\t\t\t\t\t\t\t\r\n<br />lkgblvb', '2013-09-18 20:12:42'),
(92, 'omniforum', 0, '13', 7, NULL, 3, NULL, 'Тема сообщения:', 'Проба с картинкой\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br />', '2013-09-19 11:15:12'),
(93, 'omniforum', 92, '13', 7, NULL, 2, NULL, 'Проба болда', 'BOLD', '2013-09-19 11:35:15'),
(94, 'omniforum', 92, '13', 7, NULL, 3, NULL, 'Ещё одна проба с картинкой', '-------', '2013-09-19 11:40:15'),
(95, 'omniforum', 88, '3', 7, NULL, 3, NULL, 'Тема сообщения:', '<b><i>Болд-Италик</i></b>', '2013-09-19 12:18:52'),
(96, 'omniforum', 89, '3', 7, NULL, 2, NULL, 'Тема сообщения:', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2013-09-19 13:22:31'),
(97, 'omniforum', 70, '3', 7, NULL, 2, NULL, 'Тема сообщения:', '<b>фыпфывапапфппап</b>', '2013-09-19 14:48:43'),
(98, 'omniforum', 97, '3', 7, NULL, 2, NULL, 'Тема сообщения:', '<blockquote>фыпфывапапфппап</blockquote>', '2013-09-19 14:53:14'),
(99, 'omniforum', 0, '13', 7, NULL, 2, NULL, 'Тема сообщения:', '<blockquote>BOLD</blockquote>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br />asdd', '2013-09-20 10:23:52'),
(100, 'omniforum', 0, '13', 7, NULL, 2, NULL, 'Тема сообщения:', '<blockquote>Проба с картинкой</blockquote>\t\t\t\t\t\t\t\r\n<br />', '2013-09-20 11:06:51'),
(101, 'omniforum', 0, '13', 7, NULL, 2, NULL, 'Тема сообщения:', '<blockquote>Проба с картинкой 2</blockquote>\t\t\t\t\t\t\t\r\n<br />', '2013-09-20 11:07:03'),
(102, 'omniforum', 101, '13', 7, NULL, 2, NULL, 'Тема сообщения:', '<p>zxc</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><img alt="" src="http://promo/images/1379667320_ddr2-667-non-ecc-dimm-2gb-kit-21024mb.jpg" style="width: 200px; height: 150px;" /></p>\t\t\t\t\t\t\t\r\n', '2013-09-20 12:03:38'),
(103, 'omniforum', 0, '3', 7, NULL, 3, NULL, 'ttt', '<blockquote>И каменистая поверхность стала превращаться в отдельные булыжники, когда мы ехали по ней. Под булыжниками проглядывала обнаженная черная земля. Еще через несколько минут я увидел островки зелени. Сначала их было немного, но трава была ярко-ярко зеленой, такой я ее никогда не видел на Земле. BOLD Italic H2O нижний индекс Параграф X2+Y2 верхний индекс почёркано</blockquote>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><img alt="heart" height="20" src="http://promo/ckeditor/plugins/smiley/images/heart.gif" title="heart" width="20" /></p>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><img alt="" src="/images/1369730631_kalvin.jpg" style="width: 250px; height: 253px;" />&nbsp;</p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-20 12:06:55'),
(104, 'omniforum', 89, '3', 7, NULL, 2, NULL, 'Тема сообщения:', '<p><img alt="" src="http://promo/images/1379664471_getI654mage.jpg" style="width: 320px; height: 228px;" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-20 12:08:17'),
(105, 'omniforum', 0, '15', 7, NULL, 2, NULL, 'Тема сообщения:', '<blockquote>123 456 789</blockquote>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><blockquote>&nbsp;</blockquote>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><a href="/images/1369120661_52060-190737-4bcd01cc34feb44cec6ecf89dd4b1d3f.jpg">&nbsp;ываыварывра</a></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-20 12:11:46'),
(106, 'omniforum', 105, '15', 7, NULL, 2, NULL, 'Тема сообщения:', '<blockquote>\t\t\t\t\t\t\t\r\n<br /><p><img alt="" src="/images/1369052958_2013_04_07_11_28_i_imgur_com_fdQSPgH.jpg" style="width: 278px; height: 200px;" /></p>\t\t\t\t\t\t\t\r\n<br />&nbsp;\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p>123</p>\t\t\t\t\t\t\t\r\n<br />&nbsp;\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><strike>456</strike></p>\t\t\t\t\t\t\t\r\n<br />&nbsp;\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><img alt="smiley" height="20" src="http://promo/ckeditor/plugins/smiley/images/regular_smile.gif" title="smiley" width="20" /></p>\t\t\t\t\t\t\t\r\n<br />&nbsp;\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><sub>7</sub>8<sup>9</sup></p>\t\t\t\t\t\t\t\r\n<br /></blockquote>\t\t\t\t\t\t\t\r\n<br />', '2013-09-20 12:12:46'),
(107, 'omniforum', 68, '3', 7, NULL, 2, NULL, 'Тема сообщения:', '<blockquote>\t\t\t\t\t\t\t\r\n<br /><p>qqqqqqqqqqqqqqqq</p>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p>&nbsp;</p>\t\t\t\t\t\t\t\r\n<br /></blockquote>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><img alt="yes" height="20" src="http://promo/ckeditor/plugins/smiley/images/thumbs_up.gif" title="yes" width="20" />&nbsp;</p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-20 13:14:57'),
(108, 'omniforum', 0, '16', 7, NULL, 2, NULL, 'Тема сообщения:', '<p><img alt="" src="http://promo/images/1379935922_2012_07_29_15_52_471983_1.jpeg" style="width: 598px; height: 604px;" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-23 15:32:09'),
(109, 'omniforum', 0, '20', 7, NULL, 2, NULL, 'Тема сообщения:', '<p>dtyjtyjhndtjhndtyjh</p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-24 10:14:57'),
(110, 'omniforum', 0, '23', 7, NULL, 3, NULL, 'Тема сообщения:', '<p>jvlkvlhvlvjh<img alt="" src="/images/1379426539_df209.jpg" style="width: 180px; height: 180px;" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-24 11:28:40'),
(111, 'omniforum', 110, '23', 7, NULL, 3, NULL, 'Тема сообщения:', '<p><img alt="" src="http://promo/images/1380007762_32888-212236-522cc52a32586cfc19e2a805e5ad9042.jpg" style="width: 360px; height: 480px;" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-24 11:29:29'),
(112, 'omniforum', 0, '10', 7, NULL, 2, NULL, 'Тема сообщения:', '<p><img alt="" src="http://promo/images/1380007897__C74TyIy7gw.jpg" style="width: 425px; height: 237px;" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-24 11:31:42'),
(113, 'omniforum', 0, '6', 7, NULL, 2, NULL, 'Тема сообщения:', '<p>asdgasdg</p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-25 12:17:41'),
(114, 'omniforum', 0, '27', 7, NULL, 2, NULL, 'Тема сообщения:', '<p>ыкенрыкерныкер</p>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p>&nbsp;</p>\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br /><p><img alt="" src="http://promo/images/1380099959_tumblr_mf23upancj1r3506ho1_400.jpg" style="width: 600px; height: 906px;" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-25 13:06:06'),
(115, 'omniforum', 0, '19', 4, NULL, NULL, NULL, 'Тема сообщения:', '<p><img alt="" src="/images/1379429265_df182.jpg" style="width: 180px; height: 180px;" /></p>\t\t\t\t\t\t\t\r\n<br />', '2013-09-25 13:12:44');

-- 
-- Вывод данных для таблицы sys_content
--
INSERT INTO sys_content VALUES
(54, 'button02', '0', 'Секция 002'),
(55, 'button03', '0', 'Секция 003'),
(56, 'button04', '0', 'Секция 004'),
(57, 'button02', 'data', 'Секция 02'),
(58, 'button03', 'data', 'Секция 03'),
(59, 'button04', 'data', 'Секция 04'),
(60, 'button02', 'test', '<a href="/%D0%A2%D0%B5%D1%81%D1%82/?aaa=123&ddds=765">Проба 01</a><br /><a href="/%D0%A2%D0%B5%D1%81%D1%82/?ddd=fds&ssdd=2345">Проба 02</a>'),
(61, 'button03', 'test', 'Секция 03'),
(62, 'button04', 'test', 'Секция 04'),
(63, 'button02', 'test2', '<a href="/%D0%A2%D0%B5%D1%81%D1%82/?aaa=123&ddds=765">Проба 01</a><br /><a href="/%D0%A2%D0%B5%D1%81%D1%82/?ddd=fds&ssdd=2345">Проба 02</a>'),
(64, 'button03', 'test2', 'Секция 03'),
(65, 'button04', 'test2', 'Секция 04'),
(66, 'button01', 'test3', '<a href="/%D0%A2%D0%B5%D1%81%D1%82/?aaa=123&ddds=765">Проба 01</a><br /><a href="/%D0%A2%D0%B5%D1%81%D1%82/?ddd=fds&ssdd=2345">Проба 02</a>'),
(67, 'button02', 'test3', '<a href="/%D0%A2%D0%B5%D1%81%D1%82/?aaa=123&ddds=765">Проба 01</a><br /><a href="/%D0%A2%D0%B5%D1%81%D1%82/?ddd=fds&ssdd=2345">Проба 02</a>'),
(68, 'button03', 'test3', 'Секция 03'),
(69, 'button04', 'test3', 'Секция 04'),
(70, 'button01', '0', '<a href="[{login}]">Логин</a><br />\t\t\t\t\t\t\t\r\n<a href="[{wiki}]">Вики</a><br />\t\t\t\t\t\t\t\r\n<a href="[{adm}]">Рабочее место Администратора</a><br />\t\t\t\t\t\t\t\r\n<a href="[{manager}]">Рабочее место менеджера</a><br />\t\t\t\t\t\t\t\r\n<a href="[{cash}]">Рабочее место кассира</a><br />\t\t\t\t\t\t\t\r\n');

-- 
-- Вывод данных для таблицы sys_datacheck
--
INSERT INTO sys_datacheck VALUES
(1, 'loging', '0', 'POST', 'login', 10, 'POST', 'pass', '', '', 'sys_users', 'You shall not pass!!!111<br /><img src="/imag/not_pass.jpg" />', 'Ура3'),
(2, 'logout', '0', 'POST', 'action', 11, '', 'logout', '', '', '', '', ''),
(3, 'addevent', 'manevadd', 'POST', 'namevent', 1, '', '', '', '', 'events', 'Не заполнено Название', ''),
(4, 'addevent', 'manevadd', 'POST', 'datevent', 1, '', '', '', '', 'events', 'Не заполнена дата мероприятия', ''),
(5, 'addevent', 'manevadd', 'POST', 'namevent', 5, '', '', '', '', 'events', 'Название занято', ''),
(6, 'addevent', 'manevadd', 'POST', 'guests', 1, '', '', '', '', 'events', 'Укажите количество гостей', ''),
(7, 'delbut_x', 'manager', 'POST', 'row_id', 4, '', '', '', '', 'events', 'Не найден идентификатор мероприятия', ''),
(8, 'edit_event_but_x', 'manevedit', 'POST', 'row_id', 4, '', '', '', '', 'events', 'Нет такой записи', ''),
(9, 'edit_event_but_x', 'manevedit', 'POST', 'namevent', 1, '', '', '', '', 'events', 'Не заполнено Название', ''),
(10, 'edit_event_but_x', 'manevedit', 'POST', 'datevent', 1, '', '', '', '', 'events', 'Не заполнена дата мероприятия', ''),
(11, 'edit_event_but_x', 'manevedit', 'POST', 'namevent', 5, '', '', '', '', 'events', 'Название занято', ''),
(12, 'edit_event_but_x', 'manevedit', 'POST', 'guests', 1, '', '', '', '', 'events', 'Укажите количество гостей', ''),
(13, 'loginbut', 'login', 'POST', 'login', 10, 'POST', 'pass', '', '', 'sys_users', 'You shall not pass!!<br /><img src="/imag/not_pass.jpg" />', 'Ура3'),
(14, 'lodev_del_x', 'event', 'POST', 'row_id', 4, '', '', '', '', 'link_event_lodge', 'прикрепление не найдено', ''),
(15, 'adduser', 'admusadd', 'POST', 'login', 5, '', '', '', '', 'sys_users', 'Логин занят', ''),
(16, 'adduser', 'admusadd', 'POST', 'rfid', 5, '', '', '', '', 'sys_users', 'Неуникальный RFID', ''),
(17, 'edituser', 'admusedit', 'POST', 'row_id', 4, '', '', '', '', 'sys_users', 'Нет такой записи', ''),
(18, 'user_discard_x', 'admin', 'POST', 'login', 1, '', '', '', '', 'sys_acc_cli', 'Ошибка формы', ''),
(19, 'user_discard_x', 'admin', 'POST', 'acclabs', 1, '', '', '', '', 'sys_acc_cli', 'Ошибка формы', ''),
(20, 'user_assign_x', 'admin', 'POST', 'user_id', 1, '', '', '', '', 'sys_acc_cli', 'Ошибка формы', ''),
(21, 'user_assign_x', 'admin', 'POST', 'acclabs', 1, '', '', '', '', 'sys_acc_cli', 'Ошибка формы', ''),
(22, 'user_delete_x', 'admin', 'POST', 'row_id', 4, '', '', '', '', 'sys_users', 'Нет такой записи', ''),
(26, 'salecash', 'sold', 'POST', 'event', 1, '', '', '', '', 'orders', 'не указано мероприятие', ''),
(27, 'salecash', 'sold', 'POST', 'lodgenum', 1, '', '', '', '', 'orders', 'нет номера ложи', ''),
(28, 'cashon_x', 'term', 'POST', 'row_id', 4, '', '', '', '', 'devparam', 'Нет такой записи', ''),
(29, 'cashoff_x', 'term', 'POST', 'row_id', 4, '', '', '', '', 'devparam', 'Нет такой записи', ''),
(30, 'chpu_add', 'chpuadd', 'POST', 'address', 5, '', '', '', '', 'sys_chpu', 'Такой адрес уже существует', ''),
(31, 'chpu_add', 'chpuadd', 'POST', 'label', 5, '', '', '', '', 'sys_chpu', 'Такая метка уже существует', ''),
(32, 'chpu_add', 'chpuadd', 'POST', 'address', 1, '', '', '', '', 'sys_chpu', 'Не заполнен адрес', ''),
(33, 'chpu_add', 'chpuadd', 'POST', 'label', 1, '', '', '', '', 'sys_chpu', 'не указана метка', ''),
(34, 'script_edit', 'scriptedit', 'POST', 'row_id', 4, '', '', '', '', 'sys_scripts', 'Нет такой записи', ''),
(35, 'script_edit', 'scriptedit', 'POST', 'scrip', 13, '', '', '', '', 'sys_scripts', 'Ошибка', ''),
(36, 'script_add', 'scriptadd', 'POST', 'label', 5, '', '', '', '', 'sys_scripts', 'Такая метка уже существует', ''),
(37, 'script_add', 'scriptadd', 'POST', 'label', 1, '', '', '', '', 'sys_scripts', 'Укажите метку', ''),
(38, 'test01_x', 'test', 'POST', 'itemName()', 1, NULL, NULL, NULL, NULL, 'sdktestomni', 'Не прокатило', NULL),
(39, 'test02_x', 'test', 'POST', 'itemName()', 1, NULL, NULL, NULL, NULL, 'sdktestomti', 'Хрен там', NULL),
(40, 'test04_x', 'test4', 'POST', 'bbig', 1, NULL, NULL, NULL, NULL, 'zztest', 'Сие безотрадно', NULL),
(41, 'test04d_x', 'test4', 'POST', 'row_id', 1, NULL, NULL, NULL, NULL, 'zztest', 'Отнюдь', NULL),
(42, 'elrte', 'elrte', 'POST', 'row_id', 4, '', '', '', '', 'sys_scripts', 'А вот хрен там.', ''),
(43, 'elrte', 'elrte', 'POST', 'scrip', 13, '', '', '', '', 'sys_scripts', 'Ошибка', ''),
(44, 'test004_x', 'test3', 'POST', 'bbig', 1, NULL, NULL, NULL, NULL, '', 'Отнюдь', NULL),
(45, 'test005_x', 'test3', 'POST', 'field1', 1, NULL, NULL, NULL, NULL, '', 'Неужто?', NULL),
(46, 'test006', 'wiki', 'POST', 'button04', 1, NULL, NULL, NULL, NULL, '', 'Ахтыж?', NULL),
(47, 'wysiwyg', 'wysiwyg', 'POST', 'label', 4, NULL, NULL, NULL, NULL, 'sys_scripts', 'Нет такой метки', NULL),
(48, 'wysiwyg', 'wysiwyg', 'POST', 'scrip', 13, NULL, NULL, NULL, NULL, '', 'Ошибка', NULL),
(49, 'test006', 'wiki', 'POST', 'scrip', 16, NULL, NULL, NULL, NULL, '', 'Ошибка', NULL),
(50, 'putcom', '0', 'POST', 'comment', 1, NULL, NULL, NULL, NULL, NULL, 'Сердце слов не подсказало?', NULL),
(51, 'logoutbut', 'login', 'POST', 'logoutbut', 11, '', 'logout', '', '', '', 'Досвидания!', ''),
(52, 'putmes', '0', 'POST', 'comment', 1, NULL, NULL, NULL, NULL, NULL, 'Вы забыли написать сообщение!', NULL),
(53, 'putmes', '0', 'POST', 'comment', 1, NULL, NULL, NULL, NULL, NULL, 'Заголовок не указан!', NULL),
(54, 'editmes', 'editmes', 'POST', 'comment', 1, NULL, NULL, NULL, NULL, NULL, 'Не-не-не. Удалять сообщение надо по другому!', NULL),
(55, 'editcom', 'editmes', 'POST', 'comment', 1, NULL, NULL, NULL, NULL, NULL, 'Удалять камент надо по другому!', NULL),
(56, 'editmes', 'editmes', 'POST', 'topic', 1, NULL, NULL, NULL, NULL, NULL, 'Тема как-то пустовата.', NULL),
(57, 'edit_forum_cat', 'forum_cats', 'POST', 'label', 1, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Не указана метка', NULL),
(58, 'edit_forum_cat', 'forum_cats', 'POST', 'label', 18, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Дублирование метки', NULL),
(59, 'edit_forum_cat', 'forum_cats', 'POST', 'catname', 1, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Пустое название', NULL),
(60, 'edit_forum_cat', 'forum_cats', 'POST', 'catname', 18, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Дублирование названия', NULL),
(61, 'edit_forum_cat', 'forum_cats', 'POST', 'shortname', 1, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Пустой адрес', NULL),
(62, 'edit_forum_cat', 'forum_cats', 'POST', 'shortname', 18, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Дублирование адреса', NULL),
(63, 'new_forum_cat', 'forum_cats', 'POST', 'label', 1, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Не указана метка', NULL),
(64, 'new_forum_cat', 'forum_cats', 'POST', 'label', 5, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Дублирование метки', NULL),
(65, 'new_forum_cat', 'forum_cats', 'POST', 'catname', 1, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Пустое название', NULL),
(66, 'new_forum_cat', 'forum_cats', 'POST', 'catname', 5, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Дублирование названия', NULL),
(67, 'new_forum_cat', 'forum_cats', 'POST', 'shortname', 1, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Пустой адрес', NULL),
(68, 'new_forum_cat', 'forum_cats', 'POST', 'shortname', 5, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Дублирование адреса', NULL),
(69, 'del_forum_cat', 'forum_cats', 'POST', 'row_id', 4, NULL, NULL, NULL, NULL, 'dat_forum_cats', 'Что-то пошло не так', NULL),
(70, 'del_forum_sub', 'forum_cats', 'POST', 'row_id', 4, NULL, NULL, NULL, NULL, 'dat_forum_subcat', 'Что-то пошло не так', NULL),
(71, 'edit_forum_sub', 'forum_subs', 'POST', 'subname', 1, NULL, NULL, NULL, NULL, 'dat_forum_subcat', 'Не указана подкатегория', NULL),
(72, 'edit_forum_sub', 'forum_subs', 'POST', 'parent_id', 1, NULL, NULL, NULL, NULL, 'dat_forum_subcat', 'Не указана категория', NULL),
(73, 'edit_forum_sub', 'forum_subs', 'POST', 'shortsub', 1, NULL, NULL, NULL, NULL, 'dat_forum_subcat', 'Не указан адрес', NULL),
(74, 'new_forum_sub', 'forum_subs', 'POST', 'shortsub', 1, NULL, NULL, NULL, NULL, 'dat_forum_subcat', 'Не указан адрес', NULL),
(75, 'del_forum_sub', 'forum_subs', 'POST', 'row_id', 4, NULL, NULL, NULL, NULL, 'dat_forum_subcat', 'Что-то пошло не так', NULL),
(76, 'new_forum_sub', 'forum_subs', 'POST', 'subname', 1, NULL, NULL, NULL, NULL, 'dat_forum_subcat', 'Не указана подкатегория', NULL),
(77, 'new_forum_sub', 'forum_subs', 'POST', 'parent_id', 1, NULL, NULL, NULL, NULL, 'dat_forum_subcat', 'Не указана категория', NULL),
(78, 'delmes', 'editmes', 'POST', 'row_id', 4, NULL, NULL, NULL, NULL, 'dat_forum_topics', 'Что-то пошло не так.', NULL),
(79, 'delcom', 'editmes', 'POST', 'row_id', 4, NULL, NULL, NULL, NULL, 'sys_comments', 'Что-то аошло не так', NULL),
(80, 'loginouter', 'login', 'POST', 'email', 10, 'POST', 'pwd', '', '', '1:users', 'You shall not pass!!<br /><img src="/imag/not_pass.jpg" />', '');

-- 
-- Вывод данных для таблицы sys_defaults
--
INSERT INTO sys_defaults VALUES
(1, '', 'form', 'test', NULL, '1', NULL),
(2, 'post', '', 'varr2', 'qwerty', '2', NULL),
(3, 'post', 'xml', 'proba', 'qwerty/asdf', '3/122', '/'),
(4, 'post', NULL, 'varr4', 'qwerty', '5', '/'),
(5, 'post', NULL, '_POST', 'testfield', '33', NULL),
(6, 'post', NULL, 'varr6', '', 'asdfg', ''),
(7, '', NULL, '_GET', 'qa:ws', 'фыва', ':'),
(8, NULL, NULL, 'tyrel', '122', '64', NULL),
(9, '', NULL, '_GET', '21', '321', ''),
(10, '', NULL, '_GET', 'qwaszx', '1010101010', NULL),
(15, NULL, NULL, '_GET', 'qasw', '321852', NULL);

-- 
-- Вывод данных для таблицы sys_forms
--
INSERT INTO sys_forms VALUES
(6, 'loging', '0', '<form  action=''/post''  method=''post'' name=''new_user''>\r\n   <div class=''form0'' align=''center''>\r\n   * Login <input name=''login'' type=''text'' value=''[<login>]'' size=''18'' maxlength=''30''> <br />\r\n   * Pass <input name=''pass'' type=''password'' value=''[<pass>]'' size=''18'' maxlength=''30''> <br /> \r\n   <input name=''loging'' type=''submit'' value=''Отправить'' class=''btn btn-primary'' /></div>\r\n   </form>', '', 'Логин ОК', 'clients', NULL, NULL, NULL, NULL),
(7, 'logout', '0', '<form action=''/post'' method=''post'' name=''logout'' class=''logout''>\r\n<input name=''action'' type=''hidden'' value=''logout'' />\r\n[>rankrus<]&nbsp;&nbsp;&nbsp;&nbsp;[>username<]&nbsp;&nbsp;<input name=''logout'' type=''submit'' value=''Logout'' class=''btn btn-success btn-mini''/>\r\n</form>', '', 'Логаут ОК', 'clients', NULL, NULL, NULL, NULL),
(8, 't222', 'test2', '<form action=''/%D0%9F%D1%80%D0%BE%D0%B1%D0%B0_2/''  method=''post'' name=''new_user''>\r\n   <div class=''form1'' align=''center''><p class=''alarm''>\r\n   [>message<]</p>\r\n   * Поле 1 <input name=''field1'' type=''text'' value=''[<field1>]'' size=''18'' maxlength=''30''> <br />\r\n   * Поле 2 <input name=''field2'' type=''text'' value=''[<field2>]'' size=''18'' maxlength=''30''> <br /> \r\n   * Поле 3 <input name=''field3'' type=''text'' value=''[<field3>]'' size=''18'' maxlength=''30''>  <br />\r\n   \r\n   Введите цифры с картинки:<br />\r\n\r\n   <div class=''capt''><img class=''captcha'' src=''/parts/prt_unit_captcha.php'' /></div><img class="butt" id="refresh" src="/i/refresh.png" /><input class=''captcha'' name=''captcha'' type=''text'' value=''[<captcha>]'' size=''5'' maxlength=''5''></div>\r\n   \r\n   <input name=''ok'' type=''submit'' value=''Отправить'' /></div>\r\n   </form>', 'add', 'test2 всё в порядке', 'ztest', NULL, NULL, NULL, NULL),
(10, 'delbut_x', 'manevlist', '', 'del', 'Мероприятие удалено', 'events', NULL, NULL, NULL, NULL),
(13, 'delbut_x', 'manager', '', 'del', 'Мероприятие успешно удалено', 'events', NULL, NULL, NULL, NULL),
(14, 'addevent', 'manevadd', '<form action=''[{post}]'' method=''post'' name=''event''>\r\nНазвание  <input name=''namevent'' type=''text'' value=''[<namevent>]'' size=''60'' maxlength=''255''><br />\r\nДата мероприятия <input name=''datevent'' type=''text'' value=''[<datevent>]'' size=''10'' maxlength=''10'' id=''datepicker''> \r\nВремя начала  <SELECT name=''timevent''>[>timevent<] </SELECT>\r\nТип мероприятия <SELECT name=''typevent''>[>typevent<] </SELECT>\r\nДлительность (часов) <input name=''duration'' type=''text'' value=''[<duration>]'' size=''2'' maxlength=''2''><br />\r\nКоличетво Гостей <input name=''guests'' type=''text'' value=''[<guests>]'' size=''10'' maxlength=''10''><br />\r\nПримечание<br /><textarea rows=''5'' cols=''60'' name=''notice''>[>notice<]</textarea><br />\r\n<input name=''timefin'' type=''hidden'' value=''DATE_ADD(datevent, INTERVAL HOUR(timevent+duration*10000) HOUR)''>\r\n<input name=''addevent'' type=''submit'' value=''Готово'' /></form>\r\n', 'add', 'Мероприятие добавлено', 'events', 'manevlist', NULL, NULL, NULL),
(15, 'edit_event_but_x', 'manevedit', '<form action=''[{post}]'' method=''post'' name=''event'' id=''eventform''>\r\nНазвание  <input name=''namevent'' type=''text'' value=''[<namevent>]'' size=''60'' maxlength=''255''>\r\nДата мероприятия <input name=''datevent'' type=''text'' value=''[<datevent>]'' size=''10'' maxlength=''10'' id=''datepicker''> \r\nВремя начала  <SELECT name=''timevent'' id=''timestart''>[>timevent<] </SELECT><br /><br />\r\nДлительность (час.) <input name=''duration'' type=''text'' value=''[<duration>]'' size=''2'' maxlength=''2'' id=''duration''>\r\nКоличетво Гостей <input name=''guests'' type=''text'' value=''[<guests>]'' size=''10'' maxlength=''10''>\r\nТип мероприятия <SELECT name=''typevent''>[>typevent<] </SELECT><br /><br /><p id=''fintimep''>&nbsp;[<finaltime>]</p><br />\r\nПримечание<br /><textarea rows=''5'' cols=''60'' name=''notice''>[<notice>]</textarea><br />\r\n<input name=''timefin'' type=''hidden'' value=''DATE_ADD(datevent, INTERVAL HOUR(timevent+duration*10000) HOUR)''>\r\n<input type="hidden" name="row_id" value="[<row_id>]"><br />\r\n<input name=''edit_event_but_x'' type=''submit'' value=''Готово'' /></form>', 'edit', 'Изменения сохранены', 'events', 'manevlist', NULL, NULL, NULL),
(16, 'loginbut', 'login', '<div class=''row''>\r\n<div class=''span2 offset7''>\r\n<table border=''1'' width=''100%''>\r\n<tr><td><b>Логин</b></td><td><b>Пароль</b></td></tr>\r\n<tr><td>login01</td><td>123111</td></tr>\r\n<tr><td>login2</td><td>123111</td></tr>\r\n<tr><td>login3</td><td>123111</td></tr>\r\n<tr><td>login4</td><td>123111</td></tr>\r\n<tr><td>login5</td><td>123110</td></tr>\r\n<tr><td>login6</td><td>123112</td></tr>\r\n</table>\r\n<br /><br /><br /><br />\r\n</div></div>\r\n<form action=''[{post}]'' method=''post''>\r\n   <div class=''form0'' align=''center''>\r\n   Login <br /><input name=''login'' type=''text'' value=''[<login>]'' size=''18'' maxlength=''30''> <br />\r\n   Pass <br /><input name=''pass'' type=''password'' value=''[<pass>]'' size=''18'' maxlength=''30''> <br /> \r\n   <button type="submit" name=''loginbut''  id=''oklogin'' value=''1''><img src=''/imag/buttons/round90blue90.gif'' /></button></div>\r\n   </form>', '', 'Логин ОК', 'clients', NULL, NULL, NULL, NULL),
(17, 'lodev_del_x', 'event', '', 'del', 'Ложа откреплена', 'link_event_lodge', NULL, NULL, NULL, NULL),
(18, 'lodev_add_x', 'event', '', 'add', 'Ложа прикреплена', 'link_event_lodge', NULL, NULL, NULL, NULL),
(19, 'adduser', 'admusadd', '<form action=''[{post}]'' method=''post'' name=''user''>\r\nФамилия  <input name=''surname'' type=''text'' value=''[<surname>]'' size=''32'' maxlength=''32''> \r\nИмя  <input name=''firstname'' type=''text'' value=''[<firstname>]'' size=''32'' maxlength=''32''> \r\nОтчество  <input name=''middlename'' type=''text'' value=''[<middlename>]'' size=''32'' maxlength=''32''> <br />\r\nДата рождения <input name=''birthday'' type=''text'' value=''[<birthday>]'' size=''10'' maxlength=''10'' id=''datepicker''> \r\nRFID  <input name=''rfid'' type=''text'' value=''[<rfid>]'' size=''19'' maxlength=''19''>\r\nEmail  <input name=''email'' type=''text'' value=''[<email>]'' size=''32'' maxlength=''64''> \r\nPhone  <input name=''phone'' type=''text'' value=''[<phone>]'' size=''16'' maxlength=''16''> <br />\r\nLogin  <input name=''login'' type=''text'' value=''[<login>]'' size=''16'' maxlength=''16''>\r\nLogin  <input name=''pass'' type=''text'' value=''[<pass>]'' size=''16'' maxlength=''16''>\r\n<input name=''typeuser'' type=''hidden'' value=''1''>\r\n<input name=''adduser'' type=''submit'' value=''Готово'' /></form>', 'add', 'Пользователь добавлен', 'clients', 'admin', NULL, NULL, NULL),
(20, 'edituser', 'admusedit', '<form action=''[{post}]'' method=''post'' name=''edituser''>\r\nФамилия  <input name=''surname'' type=''text'' value=''[<surname>]'' size=''32'' maxlength=''32''> \r\nИмя  <input name=''firstname'' type=''text'' value=''[<firstname>]'' size=''32'' maxlength=''32''> \r\nОтчество  <input name=''middlename'' type=''text'' value=''[<middlename>]'' size=''32'' maxlength=''32''> <br />\r\nДата рождения <input name=''birthday'' type=''text'' value=''[<birthday>]'' size=''10'' maxlength=''10'' id=''datepicker''> \r\nRFID  <input name=''rfid'' type=''text'' value=''[<rfid>]'' size=''19'' maxlength=''19''>\r\nEmail  <input name=''email'' type=''text'' value=''[<email>]'' size=''32'' maxlength=''64''> \r\nPhone  <input name=''phone'' type=''text'' value=''[<phone>]'' size=''16'' maxlength=''16''> <br />\r\nLogin  <input name=''login'' type=''text'' value=''[<login>]'' size=''16'' maxlength=''16''>\r\nLogin  <input name=''pass'' type=''text'' value=''[<pass>]'' size=''16'' maxlength=''16''>\r\n<input name=''typeuser'' type=''hidden'' value=''1''>\r\n<input type=''hidden'' name=''row_id'' value=''[<row_id>]''><br />\r\n<input name=''edituser'' type=''submit'' value=''Готово'' /></form>', 'edit', 'Пользователь изменён', 'clients', 'admin', NULL, NULL, NULL),
(21, 'user_discard_x', 'admin', '', 'add', 'Отставка ОК', 'sys_acc_cli', '', NULL, NULL, NULL),
(22, 'user_assign_x', 'admin', '', 'add', 'Назначен', 'sys_acc_cli', '', NULL, NULL, NULL),
(23, 'user_delete_x', 'admin', '', 'del', 'Пользователь удалён', 'clients', NULL, NULL, NULL, NULL),
(24, 'lodflo_del_x', 'event', '', 'del', 'Ложи откреплены', 'link_event_lodge', NULL, NULL, NULL, NULL),
(25, 'lodflo_add_x', 'event', '', 'put', 'Ложи приреплены', 'link_event_lodge', NULL, NULL, NULL, NULL),
(26, 'salecash', 'sale', '', 'add', 'Продано', 'orders', NULL, NULL, NULL, NULL),
(27, 'ordel_x', 'cashier', '', 'del', 'Удалено', 'orders', NULL, NULL, NULL, NULL),
(28, 'cashon_x', 'term', '', 'edit', 'включено', 'devparam', NULL, NULL, NULL, NULL),
(29, 'cashoff_x', 'term', '', 'edit', 'выключено', 'devparam', NULL, NULL, NULL, NULL),
(30, 'chpu_add', 'chpuadd', '', 'add', 'добавлено', 'sys_chpu', 'engine', NULL, NULL, NULL),
(32, 'chpu_del', 'engine', '', 'del', 'Удалено', 'sys_chpu', 'engine', NULL, NULL, NULL),
(33, 'chpu_edit', 'engine', '', 'edit', 'Сохранено', 'sys_chpu', 'engine', NULL, NULL, NULL),
(34, 'script_edit', 'scriptedit', '', 'edit', 'Сохранено', 'sys_scripts', 'engine', NULL, NULL, NULL),
(35, 'script_add', 'scriptadd', '', 'add', 'Сохранено', 'sys_scripts', 'engine', NULL, NULL, NULL),
(39, 'test01_x', 'test', '<form  action="/post" method="post">\r\n<input type="hidden" name="row_id" value="13">\r\n<input type="image" name="test01" src="/i/del.png" style="width:16px; height:16px;">\r\n</form>', 'del', 'Прокатило', 'sdktestomni', NULL, 1, NULL, NULL),
(40, 'test02_x', 'test', '<form  action="/post" method="post">\r\n<input type="hidden" name="row_id" value="13">\r\n<input type="image" name="test01" src="/i/add.png" style="width:16px; height:16px;">\r\n</form>', 'add', 'Добавилось', 'sdktestomni', NULL, 1, NULL, NULL),
(41, 'test04_x', 'test4', '<form  action="/post" method="post">\r\n<input type="hidden" name="bbig" value="13">\r\n<input type="image" name="test04" src="/i/add.png" style="width:16px; height:16px;">\r\n</form>', 'add', 'Hurrah!', 'zztest', NULL, NULL, NULL, NULL),
(42, 'test04d_x', 'test4', '', 'add', 'Hurrah!', 'zztest', NULL, NULL, NULL, NULL),
(43, 'elrte', 'elrte', '', 'edit', '', 'sys_scripts', '', NULL, NULL, NULL),
(44, 'test004_x', 'test3', '<form  action="/post" method="post">\r\n<input type="hidden" name="bbig" value="13">\r\n<input type="image" name="test004" src="/i/star.png" style="width:16px; height:16px;">\r\n</form>', NULL, 'Тест 01 ОК!!', NULL, NULL, NULL, NULL, NULL),
(45, 'test005_x', 'test3', '<form  action="/post" method="post">\r\n<input type="hidden" name="field1" value="13">\r\n<input type="image" name="test005" src="/i/anchor.png" style="width:16px; height:16px;">\r\n</form>', NULL, 'Тест 01 ОК!!', NULL, NULL, NULL, NULL, NULL),
(46, 'test006', 'wiki', '', NULL, 'Вот такое приятное исключение. Но оно только подтверждает правило: вскрытие любых замков — дело нехитрое. Даже высоконадежные импортные устройства с повышенной секретностью, намертво врезанные в прочные стальные двери, через 15-20 минут сдаются на милость победителю. И виной тому замочная скважина, которая их выдает.', NULL, NULL, NULL, NULL, NULL),
(47, 'wysiwyg', 'wysiwyg', '', NULL, 'Сохранено', NULL, NULL, NULL, NULL, NULL),
(48, 'test7', 'test7', NULL, NULL, 'Канает', NULL, NULL, NULL, NULL, NULL),
(49, 'putcom', '0', '<div class="add-message-f" id=''putcom''>\r\n<h3>Добавление сообщения</h3><div align=''right''><a href="#"><i class="icon-remove icon-red" id=''closeputcom''></i></a></div>\r\n<form action=''[{post}]'' method=''post'' name=''putcom'' >\r\n<input type="text"  name="headmes" class="theme-am" value="Тема сообщения:" onfocus="if(this.value==this.defaultValue)this.value='''';" onblur="if(this.value=='''')this.value=this.defaultValue;">\r\n<textarea name=''comment'' placeholder="Ваше сообщение:" onfocus="placeholder='''';" onblur="placeholder=''Ваше сообщение:'';" rows="10" id=''textcomment'' class=''textcom''></textarea>\r\nВыберите юзерпик <select name=''upic''>\r\n[>selectupic<]\r\n</select>\r\n<input name=''parent_id'' type=''hidden'' id=''parent_id''>\r\n<input name=''insert_current_label'' type=''hidden''  value=''1''>\r\n<input name=''params'' type=''hidden'' id=''params'' value=''[>params<]''>\r\n<input name=''putcom'' type=''submit'' value=''Отправить'' />\r\n<input type="reset" value="Очистить">\r\n</form>\r\n</div>', NULL, NULL, NULL, NULL, NULL, 1, NULL),
(50, 'logoutbut', 'login', '<div class=''form0'' align=''center''>   \r\n<form action=''[{post}]'' method=''post'' name=''logout'' class=''logout''>\r\n<input name=''action'' type=''hidden'' value=''logout'' />\r\n[>rankrus<]<br />\r\n[>username<]<br /><br />\r\n<input name=''logoutbut'' type=''submit'' value=''logout'' class=''btn btn-success''/>\r\n</form>\r\n</div>', '', 'Лоаут ОК', 'clients', NULL, NULL, NULL, NULL),
(51, 'putcom_res', '0', '<form action=''[{post}]'' method=''post'' name=''putcom'' id=''putcom''>\r\n<textarea name=''comment'' cols=''50'' rows=''6'' id=''textcomment''></textarea>\r\n<select name=''upic''>\r\n[>selectupic<]\r\n</select>\r\n<input name=''parent_id'' type=''hidden'' id=''parent_id''>\r\n<input name=''params'' type=''hidden'' id=''params'' value=''[>params<]''>\r\n<input name=''putcom'' type=''submit'' value=''Готово'' /></form>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'putmes', '0', '<div class="add-message-f">\r\n<h3>Новая тема</h3>\r\n<form action=''[{post}]'' method=''post'' name=''putmes'' >\r\n<input type="text"  name="topic" class="theme-am" value="Тема сообщения:" onfocus="if(this.value==this.defaultValue)this.value='''';" onblur="if(this.value=='''')this.value=this.defaultValue;">\r\n<input type="text"  name="headmes" class="theme-am" value="Заголовок:" onfocus="if(this.value==this.defaultValue)this.value='''';" onblur="if(this.value=='''')this.value=this.defaultValue;">\r\n<textarea name=''comment'' placeholder="Ваше сообщение:" onfocus="placeholder='''';" onblur="placeholder=''Ваше сообщение:'';" rows="10" id=''textcomment''></textarea>\r\nВыберите юзерпик <select name=''upic''>\r\n[>selectupic<]\r\n</select>\r\n<input name=''parent_id'' type=''hidden'' id=''0''>\r\n<input name=''params'' type=''hidden'' id=''params'' value=''[>params<]''>\r\n<input name=''subcat_id'' type=''hidden'' id=''params'' value=''[>subcat_id<]''>\r\n<input name=''putmes'' type=''submit'' value=''Отправить'' />\r\n<input type="reset" value="Очистить">\r\n</form>\r\n\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'editmes', '0', '<div class="add-message-f">\r\n<h3>Изменить</h3>\r\n<form action=''[{post}]'' method=''post'' name=''editmes'' >\r\n<input type="text"  name="topic" class="theme-am" value="[>topic<]">\r\n<input type="text"  name="headmes" class="theme-am" value="[>headmes<]">\r\n<textarea name=''comment'' rows="10" id=''textcomment''>[>comment<]</textarea>\r\n<input name=''upic'' type=''hidden'' value=''[>upic<]''>\r\n<input name=''row_id'' type=''hidden'' value=''[>row_id<]''>\r\n<input name=''parent_id'' type=''hidden'' value=''[>parent_id<]''>\r\n<input name=''params'' type=''hidden'' id=''params'' value=''[>params<]''>\r\n<input name=''subcat_id'' type=''hidden'' id=''params'' value=''[>subcat_id<]''>\r\n<input name=''editmes'' type=''submit'' value=''Отправить'' />\r\n<input type="reset" value="Очистить">\r\n</form>\r\n\r\n</div>', NULL, NULL, NULL, 'forum', NULL, 0, 1),
(54, 'editcom', '0', '<div class="add-message-f">\r\n<h3>Изменить комментарий</h3>\r\n<form action=''[{post}]'' method=''post'' name=''editcom'' >\r\n<input type="text"  name="headmes" class="theme-am" value="[>headmes<]">\r\n<textarea name=''comment'' rows="10" id=''textcomment''>[>comment<]</textarea>\r\n<input name=''upic'' type=''hidden'' value=''[>upic<]''>\r\n<input name=''row_id'' type=''hidden'' value=''[>row_id<]''>\r\n<input name=''parent_id'' type=''hidden'' value=''[>parent_id<]''>\r\n<input name=''cur_label'' type=''hidden'' value=''[>cur_label<]''>\r\n<input name=''params'' type=''hidden'' id=''params'' value=''[>params<]''>\r\n<input name=''anchor'' type=''hidden'' id=''params'' value=''[>anchor<]''>\r\n<input name=''subcat_id'' type=''hidden'' id=''params'' value=''[>subcat_id<]''>\r\n<input name=''editcom'' type=''submit'' value=''Отправить'' />\r\n<input type="reset" value="Очистить">\r\n</form>\r\n\r\n</div>', NULL, NULL, NULL, 'forum', NULL, 1, 1),
(55, 'new_forum_cat', 'forum_cats', NULL, NULL, 'Категоряи добавлена', NULL, NULL, NULL, NULL, NULL),
(56, 'new_forum_sub', 'forum_subs', NULL, NULL, 'Подкатегоряи добавлена', NULL, 'forum_cats', NULL, NULL, NULL),
(57, 'edit_forum_sub', 'forum_subs', NULL, NULL, 'Подкатегоряи изменена', NULL, 'forum_cats', NULL, NULL, NULL),
(58, 'edit_forum_cat', 'forum_cats', NULL, NULL, 'Категоряи изменена', NULL, '', NULL, NULL, NULL),
(59, 'del_forum_cat', 'forum_cats', NULL, NULL, 'Категоряи удалена', NULL, NULL, NULL, NULL, NULL),
(60, 'del_forum_sub', 'forum_subs', NULL, NULL, 'Подкатегоряи удалена', NULL, 'forum_cats', NULL, NULL, NULL),
(61, 'delcom', '0', '<div class=''row''>\r\n<form action=''[{post}]'' method=''post'' name=''delcom'' >\r\n<input name=''row_id'' type=''hidden'' value=''[>row_id<]''>\r\n<input name=''delcom'' type=''submit'' class="btn btn-danger span3 offset5" value=''Удалить'' />\r\n</form>\r\n</div>\r\n', NULL, NULL, NULL, 'forum', NULL, 0, 1),
(62, 'delmes', '0', '<div class=''row''>\r\n<form action=''[{post}]'' method=''post'' name=''delmes'' >\r\n<input name=''row_id'' type=''hidden'' value=''[>row_id<]''>\r\n<input name=''delmes'' type=''submit'' class="btn btn-danger span3 offset5" value=''Удалить'' />\r\n</form>\r\n\r\n</div>', NULL, NULL, NULL, 'omniforum', NULL, 0, NULL),
(63, 'loginouter', 'login', '<div class=''row''>\r\n<div class=''span2 offset7''>\r\n<table border=''1'' width=''100%''>\r\n<tr><td><b>Логин</b></td><td><b>Пароль</b></td></tr>\r\n<tr><td>001@email.com</td><td>123111</td></tr>\r\n<tr><td>002@email.com</td><td>123111</td></tr>\r\n<tr><td>003@email.com</td><td>123111</td></tr>\r\n<tr><td>004@email.com</td><td>123111</td></tr>\r\n<tr><td>005@email.com</td><td>123110</td></tr>\r\n<tr><td>006@email.com</td><td>123112</td></tr>\r\n</table>\r\n<br /><br /><br /><br />\r\n</div></div>\r\n<form action=''[{post}]'' method=''post''>\r\n   <div class=''form0'' align=''center''>\r\n   Login <br /><input name=''email'' type=''text'' value=''[<email>]'' size=''18'' maxlength=''30''> <br />\r\n   Pass <br /><input name=''pwd'' type=''password'' value=''[<pwd>]'' size=''18'' maxlength=''30''> <br /> \r\n   <button type="submit" name=''loginouter''  id=''oklogin'' value=''1''><img src=''/imag/buttons/round90blue90.gif'' /></button></div>\r\n   </form>', '', 'Логин ОК', '', NULL, NULL, NULL, NULL);

-- 
-- Вывод данных для таблицы sys_iniset
--
INSERT INTO sys_iniset VALUES
(9, 'magic_quotes_gpc', '0'),
(10, 'upload_tmp_dir', '/home/promo/www/temp/');

-- 
-- Вывод данных для таблицы sys_joincont
--
INSERT INTO sys_joincont VALUES
(1, 'wiki', 'wiki', 1, 'subject', 'content', 'title', 'keywords', 'description', NULL, NULL, NULL, NULL),
(2, 'omniforum', 'dat_forum_topics', 3, 'row_id', '', 'topic', NULL, 'topic', NULL, NULL, NULL, NULL);

-- 
-- Вывод данных для таблицы sys_joinfields
--
INSERT INTO sys_joinfields VALUES
(1, 2, 'dat_forum_topics', NULL);

-- 
-- Вывод данных для таблицы sys_joinlabs
--
INSERT INTO sys_joinlabs VALUES
(1, 'logout', '0'),
(2, 't222', 'test2'),
(3, 'loging', '0'),
(4, 'loginbut', 'login'),
(5, 'delbut_x', 'manevlist'),
(6, 'edit_event_but_x', 'manevedit'),
(7, 'lodev_del_x', 'event'),
(8, 'lodev_add_x', 'event'),
(9, 'adduser', 'admusadd'),
(10, 'delbut_x', 'manager'),
(11, 'addevent', 'manevadd'),
(12, 'edituser', 'admusedit'),
(13, 'user_discard_x', 'admin'),
(14, 'user_assign_x', 'admin'),
(15, 'user_delete_x', 'admin'),
(16, 'lodflo_del_x', 'event'),
(17, 'lodflo_add_x', 'event'),
(18, 'salecash', 'sale'),
(19, 'ordel_x', 'cashier'),
(20, 'cashon_x', 'term'),
(21, 'cashoff_x', 'term'),
(22, 'chpu_add', 'chpuadd'),
(23, 'chpu_del', 'engine'),
(24, 'chpu_edit', 'engine'),
(25, 'script_edit', 'scriptedit'),
(26, 'script_add', 'scriptadd'),
(27, 'test01_x', 'test'),
(28, 'test02_x', 'test'),
(29, 'test04_x', 'test4'),
(30, 'test04d_x', 'test4'),
(31, 'elrte', 'elrte');

-- 
-- Вывод данных для таблицы sys_keyfields
--
INSERT INTO sys_keyfields VALUES
(1, 'sys_chpu', 'address'),
(2, 'users', 'login'),
(3, 'access', 'param'),
(4, 'link_user_acc', 'user_id'),
(5, 'sys_keyfields', 'keyfield'),
(6, 'sys_redirect', 'url'),
(7, 'sys_cfg', 'numtype'),
(8, 'sys_forms', 'nam'),
(9, 'lodges', 'numb'),
(10, 'sys_content', 'label'),
(11, 'links', 'domain'),
(12, 'captcha', 'num'),
(13, 'mylinks', 'phrase'),
(15, 'zakaz', 'row_id'),
(16, 'snips', 'label'),
(17, 'sys_temps', 'label'),
(18, 'lodges', 'numb'),
(19, 'events', 'namevent'),
(20, 'typevents', 'typevent'),
(21, 'typelodges', 'typelodge'),
(22, 'pricelodges', 'typelodge'),
(23, 'orders', 'lodgenum'),
(24, 'typepayms', 'typepaym'),
(25, 'actions', 'row_id'),
(26, 'sys_users', 'account'),
(27, 'typeusers', 'typeuser'),
(28, 'typecolors', 'typecolor'),
(29, 'typeactions', 'typeaction'),
(30, 'link_user_ord', 'user_id'),
(31, 'sys_datacheck', 'row_id'),
(32, 'ztest', 'row_id'),
(33, 'sys_accrank', 'acclabel'),
(34, 'sys_acclabels', 'chpulab'),
(35, 'sys_acc_cli', 'id_acl'),
(36, 'link_event_lodge', 'id_lodge'),
(37, 'devices', 'devid'),
(38, 'devparam', 'paramname'),
(39, 'sys_scripts', 'label'),
(40, 'sys_joincont', 'label'),
(41, 'wiki', 'subject'),
(42, 'sys_catalog', 'level'),
(43, 'zz_categ', 'nam'),
(44, 'zz_bukets', 'bouquet'),
(45, 'zz_sites', 'domain'),
(46, 'zztest', 'row_id'),
(47, 'sys_actions', 'row_id'),
(48, 'sys_iniset', 'parameter'),
(49, 'sys_defaults', 'row_id'),
(50, 'sys_comments', 'row_id');

-- 
-- Вывод данных для таблицы sys_redirect
--
INSERT INTO sys_redirect VALUES
(1, NULL, 'Абракадабра', 'Администратор/Назначения', NULL),
(2, 'test_redirect', NULL, '', NULL);

-- 
-- Вывод данных для таблицы sys_scripts
--
INSERT INTO sys_scripts VALUES
(1, 'main', 'php', 'echo "Главная страница процессинговой системы+++";\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\necho ''<br /><a href="#" class="lightbut" rel="test001">гриб</a><br /><br /><br />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div id="test001" class="lightbox"><p>\t\t\t\t\t\t\t\r\n<img src="/imag/coca.gif" width="235" height="320"/><br />\t\t\t\t\t\t\t\r\n<a href="#" class="lightclose" rel="test001">x</a></p>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<br /><a href="#" class="lightbut" rel="test001">паук</a><br /><br /><br />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'';\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\necho ($proc->fill_url(''//''));\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n//echo $_SESSION[''message''];\t\t\t\t\t\t\t\r\n//dropsess(droplist);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\nech($_POST);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\necho ''<form action="/" method="post">\t\t\t\t\t\t\t\r\n<input type="hidden" name="var1" value="toad">\t\t\t\t\t\t\t\r\n<button type="submit" name="var007" value="asdf" class="btn btn-link">\t\t\t\t\t\t\t\r\n<i class="icon-fire icon-garden"></i></button>\t\t\t\t\t\t\t\r\n</form>'';\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\necho ''\t\t\t\t\t\t\t\r\n<div class="btn-toolbar">\t\t\t\t\t\t\t\r\n  <div class="btn-group">\t\t\t\t\t\t\t\r\n    <button class="btn btn-info">1</button>\t\t\t\t\t\t\t\r\n    <button class="btn btn-info">2</button>\t\t\t\t\t\t\t\r\n    <button class="btn btn-info disabled">3</button>\t\t\t\t\t\t\t\r\n    <button class="btn btn-info">4</button>\t\t\t\t\t\t\t\r\n  </div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="pagination pagination-mini">\t\t\t\t\t\t\t\r\n  <ul>\t\t\t\t\t\t\t\r\n    <li><a href="/%D0%90%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%82%D0%BE%D1%80">Prev</a></li>\t\t\t\t\t\t\t\r\n    <li><a href="/%D0%90%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%82%D0%BE%D1%80">1</a></li>\t\t\t\t\t\t\t\r\n    <li><a href="/%D0%90%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%82%D0%BE%D1%80">2</a></li>\t\t\t\t\t\t\t\r\n    <li class="disabled"><a href="#">3</a></li>\t\t\t\t\t\t\t\r\n    <li><a href="#">4</a></li>\t\t\t\t\t\t\t\r\n    <li><a href="#">5</a></li>\t\t\t\t\t\t\t\r\n    <li><a href="#">Next</a></li>\t\t\t\t\t\t\t\r\n  </ul>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n'';\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\necho ''\t\t\t\t\t\t\t\r\n<a href="/%D0%90%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%82%D0%BE%D1%80"><button class="btn btn-warning">next</button></a>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'';\t\t\t\t\t\t\t\r\n//ech($proc->sys);\t\t\t\t\t\t\t\r\n$proc->mod["range"]=''45:60'';\t\t\t\t\t\t\t\r\n$proc->fetch(''sys_users'');\t\t\t\t\t\t\t\r\n//ech($proc->tabdata[''sys_users'']);\t\t\t\t\t\t\t\r\n//ech($proc->tabdata[''sys_content'']);\t\t\t\t\t\t\t\r\n$tag = ''DSBL'';\t\t\t\t\t\t\t\r\n$tag = str_replace(''DSBL'', ''class="disabled"'', $tag);\t\t\t\t\t\t\t\r\n//echo $tag;\t\t\t\t\t\t\t\r\necho ''[>pagination<]'';\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(2, 'test', 'html', '<a href="[{wiki/Вторая запись}]">222</a><br />\t\t\t\t\t\t\t\r\n[{wiki}]<br />\t\t\t\t\t\t\t\r\n[{wiki}]<br />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\nВторая запись:\t\t\t\t\t\t\t\r\n<b>Второй заголовок</b><br />\t\t\t\t\t\t\t\r\nссылка на пункт [{test}]<br />\t\t\t\t\t\t\t\r\nкусок контента [>button04<]<br />\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\nссылка на пункт <a href=" [{wiki/Пробная тема}]">GПробн.</a><br />\t\t\t\t\t\t\t\r\nссылка на test2 <a href=" [{test2/1234sdfg}]">TEST 2</a><br />\t\t\t\t\t\t\t\r\n[{test2}]\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><br />\t\t\t\t\t\t\t\r\n<a class="lightbut" href="#" rel="test001">гриб</a></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><button id=''testbut''>TEST</button></p>\t\t\t\t\t\t\t\r\n<p> </p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="lightbox" id="test001">\t\t\t\t\t\t\t\r\n<p><img height="320" src="/imag/coca.gif" width="235" /><br />\t\t\t\t\t\t\t\r\n<a class="lightclose" href="#" rel="test001">x</a></p>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><br />\t\t\t\t\t\t\t\r\n<a class="lightbut" href="#" rel="test001">гриб</a><br />\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<a class="lightbut" href="#" rel="test001">гриб</a></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p> </p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<form action="/%D0%B2%D0%B8%D0%BA%D0%B8" method="post" name="edituser"><input name="button05" type="hidden" value="Буй" /> <input name="button06" type="hidden" value="Звезда" /> <input name="button03" type="hidden" value="Джигурда" /> <input name="button04" type="hidden" value="189" /> <input name="test006" type="submit" value="Готово" /> </form>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p> </p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><br />\t\t\t\t\t\t\t\r\n123</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p> </p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p style="background: url(/imag/back/simple001.gif); padding:20px;"><img src="http://promo/dyatpear" title="" /></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(3, 'tesst', 'html', '<p><strong style="line-height: 1.6em;"><span style="color:#FF0000;"><span style="line-height: 1.6em;">kljhg<span style="background-color:#FFFF00;">oig</span>o</span></span><span style="color:#0000FF;"><span style="line-height: 1.6em;">goi</span></span></strong></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><button id=''testbut''>TEST</button></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>zdfgfg</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p> </p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p> </p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<form action="/post" class="comments" method="post"><input name="author" type="hidden" value="" /> <input name="parent_id" type="hidden" value="" /> <input name="param" type="hidden" value="" /> <input name="upic" type="hidden" value="" /> <input name="test" type="text" value="" /><br />\t\t\t\t\t\t\t\r\n<input class="btn btn-info" name="putcom" type="submit" value="Готово" /> </form>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(4, 'addpict', 'php', '//echo ''<b>test</b><br />'';\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\necho ''<form name="upload" action="/addpicproc" method="POST" ENCTYPE="multipart/form-data">\t\t\t\t\t\t\t\r\n Select the file to upload: <input type="file" name="userfile">\t\t\t\t\t\t\t\r\n <input type="submit" name="upload" value="upload" class="btn btn-primary">\t\t\t\t\t\t\t\r\n</form>'';\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(5, 'addpicproc', 'php', ' $blacklist = array(&quot;.php&quot;, &quot;.phtml&quot;, &quot;.php3&quot;, &quot;.php4&quot;);\t\t\t\t\t\t\t\r\n foreach ($blacklist as $item) {\t\t\t\t\t\t\t\r\n  if(preg_match(&quot;/$item$/i&quot;, $_FILES[''userfile''][''name''])) {\t\t\t\t\t\t\t\r\n   echo &quot;We do not allow uploading PHP files\t\t\t\t\t\t\t\r\n&quot;;\t\t\t\t\t\t\t\r\n   exit;\t\t\t\t\t\t\t\r\n   }\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n  $uploaddir = ''uploads/'';\t\t\t\t\t\t\t\r\n  $uploadfile = $uploaddir . basename($_FILES[''userfile''][''name'']);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n  if (move_uploaded_file($_FILES[''userfile''][''tmp_name''], $uploadfile)) {\t\t\t\t\t\t\t\r\n   echo &quot;File is valid, and was successfully uploaded.\t\t\t\t\t\t\t\r\n&quot;;\t\t\t\t\t\t\t\r\n  } else {\t\t\t\t\t\t\t\r\n   echo &quot;File uploading failed.\t\t\t\t\t\t\t\r\n&quot;;\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n//Комментарий\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(6, 'test4', 'html', '<p>© ® ™  º ª   ‰ π ¦ §    </p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><span style="color:#FF0000;"><strong>° µ ¶ </strong></span>… ‾ ´</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><span style="line-height: 1.6em;">∀  </span></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><strong><span style="color:#0000FF;"><strike><u>123</u></strike></span></strong></p>\t\t\t\t\t\t\t\r\n'),
(7, 'jigurda', 'php', '&lt;span style=&quot;color:#00ffff;font-family:''comic sans ms'', cursive;font-size:x-large&quot;&gt;Буй&lt;/span&gt;&lt;div style=&quot;color:#ff00ff;font-size:large;font-family:impact, sans-serif&quot;&gt;Звезда&lt;/div&gt;&lt;div style=&quot;font-size:xx-large;font-family:arial, helvetica, sans-serif;color:#ffff00&quot;&gt;Джигурда&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;с нами навсегда  &lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;img src=&quot;/imag/pultsmall.jpg&quot; style=&quot;width:150px;height:116px&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;div&gt;Блок&lt;/div&gt;&lt;/div&gt;&lt;div&gt;\t\t\t\t\t\t\t\r\n&lt;table rules=&quot;none&quot; style=&quot;width:50px;height:60px;border:1px solid&quot;&gt;\t\t\t\t\t\t\t\r\n&lt;caption&gt;Таблица&lt;/caption&gt;\t\t\t\t\t\t\t\r\n&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;01&lt;/td&gt;&lt;td&gt;02&lt;/td&gt;&lt;td&gt;03&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;04&lt;/td&gt;&lt;td&gt;05&lt;/td&gt;&lt;td&gt;06&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;br&gt;&lt;/div&gt;'),
(9, 'test5', 'php', 'echo ''++++++++++++++++'';\t\t\t\t\t\t\t\r\n'),
(10, 'phpinfo', 'php', 'phpinfo();\t\t\t\t\t\t\t\r\n/*\t\t\t\t\t\t\t\r\nif ($db = sqlite_open(''sqlite/test02.db'', 0666, $sqliteerror)) { \t\t\t\t\t\t\t\r\n    sqlite_query($db, ''CREATE TABLE foo (bar varchar(10))'');\t\t\t\t\t\t\t\r\n    sqlite_query($db, "INSERT INTO foo VALUES (''fnord'')");\t\t\t\t\t\t\t\r\n    $result = sqlite_query($db, ''select bar from foo'');\t\t\t\t\t\t\t\r\n    var_dump(sqlite_fetch_array($result)); \t\t\t\t\t\t\t\r\n} else {\t\t\t\t\t\t\t\r\n    die($sqliteerror);\t\t\t\t\t\t\t\r\n}\t\t\t\t\t\t\t\r\n*/\t\t\t\t\t\t\t\r\n//echo chr(230);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(11, 'blitz', 'php', '$T = new Blitz();\t\t\t\t\t\t\t\r\n$T-&gt;load(''{{ include(&quot;blitz/tests/test_cast.tpl&quot;) }}'');\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n$list_names = array(''Jeff Bridges'', ''John Goodman'', ''Julianne Moore'', ''Steve Buscemi'');\t\t\t\t\t\t\t\r\nforeach ($list_names as $i_name) {\t\t\t\t\t\t\t\r\n    $T-&gt;block(''/cast'', array(''name'' =&gt; $i_name), TRUE);\t\t\t\t\t\t\t\r\n}\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n$T-&gt;set(array(''film'' =&gt; ''The Big Lebowski''));\t\t\t\t\t\t\t\r\n$data = $T-&gt;getIterations();\t\t\t\t\t\t\t\r\necho ''&lt;pre&gt;'';\t\t\t\t\t\t\t\r\nvar_dump($data);\t\t\t\t\t\t\t\r\n$T-&gt;clean();\t\t\t\t\t\t\t\r\nvar_dump($T-&gt;getIterations());\t\t\t\t\t\t\t\r\n$T-&gt;display($data);\t\t\t\t\t\t\t\r\necho ''&lt;/pre&gt;'';\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(12, 'testsecur', 'php', '1<b>2</b>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(13, 'testhtml', 'html', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml">\t\t\t\t\t\t\t\r\n<head>\t\t\t\t\t\t\t\r\n<title>Кабинет интегратора - страница 1</title>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng_portal.css" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/style.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/cabinet.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootstrap.css" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/jquery-1.7.2.js"></script>\t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/flexcroll.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap-alert.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript">\t\t\t\t\t\t\t\r\nfunction clickdisplay(objName, a) {\t\t\t\t\t\t\t\r\nvar object = document.getElementById(objName);\t\t\t\t\t\t\t\r\nobject.style.display = (object.style.display == ''none'') ? '''' : ''none''\t\t\t\t\t\t\t\r\n}\t\t\t\t\t\t\t\r\n \t$(document).on(''mouseover'', ''.menu ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".menu ul li").addClass("hover");\t\t\t\t\t\r\n \t}).on(''mouseout'', ''.menu ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".menu ul li").removeClass("hover");\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t$(document).on(''mouseover'', ''.top-menu-c ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".top-menu-c ul li").addClass("hover");\t\t\t\t\t\r\n \t}).on(''mouseout'', ''.top-menu-c ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".top-menu-c ul li").removeClass("hover");\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<textarea>\t\t\t\t\t\t\t\r\n<!-- page -->\t\t\t\t\t\t\t\r\n</textarea>\t\t\t\t\t\t\t\r\n<div class="top-panel">\t\t\t\t\t\t\t\r\n \t<div class="top-content">\t\t\t\t\t\t\r\n \t\t<a class="hide-menu" onclick="clickdisplay(''header'', this), clickdisplay(''logo-small'', this), this.className = (this.className == ''hide-menu top'' ? ''hide-menu'' : ''hide-menu top'')"></a>\t\t\t\t\t\r\n \t\t<a href="/" class="logo-small" id="logo-small" style="display:none;">Assymbix</a>\t\t\t\t\t\r\n \t\t<div class="settings-profile">\t\t\t\t\t\r\n \t\t\t<span><img src="images/default-avatar.png" width="14" height="18" alt="Это Вы" title="Это Вы" /></span>\t\t\t\t\r\n \t\t\t<span>Иванов Иван Иванович</span>\t\t\t\t\r\n \t\t\t<a href="/">Личный кабинет</a>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<div class="page">\t\t\t\t\t\t\t\r\n<!-- header -->\t\t\t\t\t\t\t\r\n<div class="header" id="header">\t\t\t\t\t\t\t\r\n \t<a href="/" class="logo">Assymbix</a>\t\t\t\t\t\t\r\n \t<div class="search-info">\t\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t<span><form action=''/post'' method=''post'' name=''logout''>\t\t\t\t\t\r\n<input name=''action'' type=''hidden'' value=''logout'' />\t\t\t\t\t\t\t\r\nАдминистратор    login4<input name=''logout'' type=''submit'' value=''Logout'' class=''btn btn-success''/>\t\t\t\t\t\t\t\r\n</form> </span>\t\t\t\t\t\t\t\r\n \t\t<input type="text" class="search" value="Поиск" onfocus="if(this.value==this.defaultValue)this.value='''';" onblur="if(this.value=='''')this.value=this.defaultValue;"/>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<div class="menu">\t\t\t\t\t\t\r\n \t\t<ul>\t\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">О проекте</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Правила</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Как это работает</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Платформа</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Новинки платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Особенности платформы</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group"  href="/">Разработчикам</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Исходный код</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Готовые компоненты</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Маркет</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Бесплатные программы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Платные программы</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Новости</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Последние новости</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Важные новости</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/">Аналитика</a></li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Блог</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Свежие посты</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">С плесенью</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/">Форум</a></li>\t\t\t\t\r\n \t\t\t<li><a href="/">Контакты</a></li>\t\t\t\t\r\n \t\t</ul>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end header -->\t\t\t\t\t\t\t\r\n<!-- content cabinet -->\t\t\t\t\t\t\t\r\n<div class="content-c">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="clear"></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end content cabinet -->\t\t\t\t\t\t\t\r\n<div class="end-page"></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end page -->\t\t\t\t\t\t\t\r\n<!-- footer -->\t\t\t\t\t\t\t\r\n<div class="footer">\t\t\t\t\t\t\t\r\n© Все права защиищены. Копирование запрещено. 2012-\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end footer -->\t\t\t\t\t\t\t\r\n<!-- select -->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script>\t\t\t\t\t\t\t\r\n$(function() {\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\tvar select = $(''.style-select'');\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\tselect.each(function() {\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t/**\t\t\t\r\n \t\t\t\t * vars\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\tvar $this = $(this);\t\t\t\r\n \t\t\t\tvar select_main = $(''<div />'', { class: ''select-main'' }).insertAfter(this);\t\t\t\r\n \t\t\t\tvar select_wrap = $(''<div />'', { class: ''select-wrapper'' }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar span = $(''<span />'').appendTo(select_wrap);\t\t\t\r\n \t\t\t\tvar div_button = $(''<div />'').appendTo(select_wrap);\t\t\t\r\n \t\t\t\tvar select_menu = $(''<ul />'', { class: ''select-menu'' }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar input = $(''<input />'', { type: ''hidden'', name: this.name }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar toggler;\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t/** \t\t\t\r\n \t\t\t\t * add css styles по нужной ширине - в зависимости от содержимого присваивается ширина элементу \t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tselect_wrap.css(''height'', $this.height()).add(select_menu).css(''width'',$this.width());\t\t\t\r\n \t\t\t\t$this.css(''display'', ''none'');\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\t/**\t\t\t\r\n \t\t\t\t * create menu\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\tspan.html(this.options[0].innerHTML);\t\t\t\r\n \t\t\t\tinput.attr(''value'', this.options[0].value);\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tfor(var i=0; i < this.options.length; i++) {\t\t\t\r\n \t\t\t\t\t$(''<li />'', { value:this.options[i].value, html: this.options[i].innerHTML }).appendTo(select_menu).click(function() {\t\t\r\n \t\t\t\t\t\tspan.html(this.innerHTML);\t\r\n \t\t\t\t\t\tinput.attr(''value'', this.value);\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\tselect_menu.hide();\t\r\n \t\t\t\t\t\ttoggler = !toggler;\t\r\n \t\t\t\t\t});\t\t\r\n \t\t\t\t}\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tselect_wrap.click(function() {\t\t\t\r\n \t\t\t\t\tif (!toggler) {\t\t\r\n \t\t\t\t\t\tselect_menu.show();\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t} else {\t\t\r\n \t\t\t\t\t\tselect_menu.hide();\t\r\n \t\t\t\t\t}\t\t\r\n \t\t\t\t\ttoggler = !toggler;\t\t\r\n \t\t\t\t});\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t});\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<!-- +++ end select -->\t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(14, 'pagintest', 'php', '$range = $proc->pageread(''page '', 11, 1);\t\t\t\t\t\t\t\r\n$proc->mod["fields"]= ''row_id, account'';\t\t\t\t\t\t\t\r\n$proc->mod["order"]= ''row_id'';\t\t\t\t\t\t\t\r\n$proc->mod["range"] = $range;\t\t\t\t\t\t\t\r\n//$proc->mod["range"] = "0:15";\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n$proc->fetch(''sys_users'');\t\t\t\t\t\t\t\r\necho ''[>pagination<]'';\t\t\t\t\t\t\t\r\necho ''<br /><br />[>button03<]'';\t\t\t\t\t\t\t\r\necho ''<a href="[{adm}]">Админ</a>'';\t\t\t\t\t\t\t\r\nech($proc->tabdata[''sys_users'']);\t\t\t\t\t\t\t\r\n//ech($cont->replace);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(15, 'testdata', 'php', '/* $range = $proc->pageread(''page '', 15, 1); \t\t\t\t\t\t\t\r\n$proc->mod["fields"]= ''row_id, account''; \t\t\t\t\t\t\t\r\n$proc->mod["order"]= ''row_id''; \t\t\t\t\t\t\t\r\n$proc->mod["range"] = $range; \t\t\t\t\t\t\t\r\n//$proc->mod["range"] = "0:15"; \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\necho chr(219); //echo ord(''Ы''); \t\t\t\t\t\t\t\r\n$proc->fetch(''sys_users''); \t\t\t\t\t\t\t\r\necho ''[>pagination<]''; echo ''\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n[>button03<]''; echo ''\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\nАдмин''; \t\t\t\t\t\t\t\r\nech($proc->tabdata[''sys_users'']); */ \t\t\t\t\t\t\t\r\nech($_SESSION); \t\t\t\t\t\t\t\r\nech($_GET); ech($tyrel); $proc->tabdata[''sys_content''][''title''][''content''] = ''123456==''; //ech($data->classes); //$form->test = ''ljhfglv''; \t\t\t\t\t\t\t\r\necho ''\t\t\t\t\t\t\t\r\n+++: ''.$form->test; ech($xml->proba); ech($proc->tabdata[''sys_defaults'']); \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(16, 'folders', 'php', 'if ($dir = opendir(''.''))  \t\t\t\t\t\t\t\r\n{       \t\t\t\t\t\t\t\r\n   while (false !== ($file874 = readdir($dir))){ \t\t\t\t\t\t\t\r\n      if (($file874 != ''.'') && ($file874 != ''..'')){  \t\t\t\t\t\t\t\r\n \t\t  if (substr_count($file874,''.'') == 0){ \t\t\t\t\t\r\n \t\t\t echo $file874.''<br />''; \t\t\t\t\r\n \t\t  }else{\t\t\t\t\t\r\n \t\t\t echo $file874.''<br />'';\t\t\t\t\r\n \t\t  }\t\t\t\t\t\r\n      } \t\t\t\t\t\t\t\r\n   } \t\t\t\t\t\t\t\r\nclosedir($dir); \t\t\t\t\t\t\t\r\n} \t\t\t\t\t\t\t\r\n'),
(17, 'testfolder', 'html', ' - копия.htaccess<br />!!!_Readme.txt<br />.htaccess<br />1_login.php<br />1_template.php<br />1_temp_ceram.php<br />1_temp_test.php<br />1_test.php<br />1_xml_test.php<br />amazon<br />amazon.rar<br />blitz<br />boilerplate.css<br />bootstrap.php<br />changelog.html<br />ckeditor<br />classes<br />CodeMirror<br />css<br />data000.php<br />data001.php<br />data_404.php<br />data_adm.php<br />data_admin.php<br />data_admusedit.php<br />data_admuseradd.php<br />data_cash.php<br />data_cashier.php<br />data_catal.php<br />data_chpuadd.php<br />data_data.php<br />data_elrte.php<br />data_engine.php<br />data_event_lodge.php<br />data_login.php<br />data_manager.php<br />data_manevadd.php<br />data_manevedit.php<br />data_manevlist.php<br />data_page.php<br />data_post.php<br />data_postlodges.php<br />data_postrfid.php<br />data_pref.php<br />data_reg.php<br />data_sale.php<br />data_scriptadd.php<br />data_scriptedit.php<br />data_term.php<br />data_test.php<br />data_test2.php<br />data_test3.php<br />data_test4.php<br />data_test5.php<br />data_test6.php<br />data_wysiwyg.php<br />data_xml.php<br />dop<br />dumps<br />editor<br />elfinder<br />elrte<br />elrte-1.3<br />examples<br />favic.png<br />favicon.ico<br />functions<br />goods.xml<br />i<br />ico<br />iesnap.png<br />imag<br />images<br />img<br />img_vars.php<br />index.php<br />js<br />kcfinder<br />lib<br />Manul.docx<br />menu_01.php<br />menu_02.php<br />mods<br />multicurl.php<br />nicEdit<br />page1.php<br />page2.php<br />parts<br />pcom<br />php<br />phpinfo.php<br />pma<br />post.php<br />proba_new.php<br />process<br />redis<br />redis.php<br />respond.min.js<br />robots.txt<br />rubber.html<br />sociable-re<br />sqlite<br />temp<br />temps<br />test.php<br />test_blitz.php<br />test_blitz00.php<br />test_ckeditor.php<br />test_css.php<br />test_data.php<br />test_elfinder.html<br />test_elrte.html<br />test_elrte2.html<br />test_fork.php<br />test_fork2.php<br />test_preg.php<br />test_redis.php<br />test_sqlite.php<br />test_wysihtml.php<br />test_wysihtml5.php<br />tmp_portal.php<br />upload<br />uploads<br />WeatherLocationDatabase.txt<br />wymeditor<br />wysihtml5<br />zzreserve<br />_serv_php.ini<br />_uploader<br />_web.config<br />жозефина.txt<br />'),
(18, 'test7', 'php', '$proc->mod[''filter''] = ''cur_label="main"'';\t\t\t\t\t\t\t\r\n//$proc->mod[''index''] = 1;\t\t\t\t\t\t\t\r\n$proc->fetch(''sys_comments'');\t\t\t\t\t\t\t\r\n/*\t\t\t\t\t\t\t\r\n$proc->arr_in = $proc->tabdata[''sys_comments''];\t\t\t\t\t\t\t\r\n$proc->arr_lab = ''parent_id'';\t\t\t\t\t\t\t\r\nunset($proc->arr_out);\t\t\t\t\t\t\t\r\n$proc->rearray();\t\t\t\t\t\t\t\r\n*/\t\t\t\t\t\t\t\r\n$arr_col = array_colum($proc->tabdata[''sys_comments''], ''parent_id'');\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\nech($arr_col);\t\t\t\t\t\t\t\r\n$arr = $proc->tabdata[''sys_comments''];\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n//$artab = $proc->ar2tab($ar_res);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\nech($arr);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n//echo $artab;\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(20, 'dyatpear', 'php', '//header(''Content-Type: image/png'');\t\t\t\t\t\t\t\r\n$im = imagecreatetruecolor(600, 300);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n$black = imagecolorallocate($im, 0, 0, 0);\t\t\t\t\t\t\t\r\n$red = imagecolorallocate($im, 255, 0, 0);\t\t\t\t\t\t\t\r\n$white = imagecolorallocate($im, 255, 255, 255);\t\t\t\t\t\t\t\r\n$green = imagecolorallocate($im, 0, 128, 0);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n// Make the background transparent\t\t\t\t\t\t\t\r\nimagecolortransparent($im, $white);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n// Draw a red rectangle\t\t\t\t\t\t\t\r\n//imagefilledrectangle($im, 0, 0, 500, 300, $black);\t\t\t\t\t\t\t\r\nimagefilledrectangle($im, 0, 0, 600, 300, $green);\t\t\t\t\t\t\t\r\n//imagefilledrectangle($im, 20, 20, 480, 280, $white)\t\t\t\t\t\t\t\r\nimagefilledrectangle($im, 20, 20, 580, 280, $white);\t\t\t\t\t\t\t\r\n$addr = "Пробная надпись";\t\t\t\t\t\t\t\r\n//$addr = convert_cyr_string( $addr, "w", "i" );\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\nimagettftext ($im, 40, 0, 100, 100, $red, "impact.ttf", $addr);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\nimagepng($im);\t\t\t\t\t\t\t\r\nimagedestroy($im);\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n'),
(21, 'testcontent', 'html', '\t<div class="header-c">\t\t\t\t\t\t\r\n \t\t<h1 class="page-title-c">Кабинет интегратора</h1>\t\t\t\t\t\r\n \t\t<div class="top-menu-c">\t\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Организации и пользователи</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Компоненты</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Разворачивание ЭПС</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/" class="active">Установленные ЭПС</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<!--<div class="back-cabinet"><a href="/">Личный кабинет</a></div>-->\t\t\t\t\t\t\r\n \t<div class="menu-c">\t\t\t\t\t\t\r\n \t\t<a href="/" class="button-c active">Прикладные системы</a>\t\t\t\t\t\r\n \t\t<a href="/" class="button-c">Карточка пркладной системы</a>\t\t\t\t\t\r\n \t\t<a href="/" class="button-c">Мониторинг прикладной системы</a>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<!-- component -->\t\t\t\t\t\t\r\n \t<div class="component-c">\t\t\t\t\t\t\r\n \t\t<div class="caption-table-c">Установленные прикладные системы</div>\t\t\t\t\t\r\n \t\t<div class="caption-settings-c">\t\t\t\t\t\r\n \t\t\t<input type="text" class="search" value="Поиск" onfocus="if(this.value==this.defaultValue)this.value='''';" onblur="if(this.value=='''')this.value=this.defaultValue;"/>\t\t\t\t\r\n \t\t\t<a href="#" class="refresh-c"></a>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t\t<table>\t\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<th><div>Наименование ЭПС<div class="sorting"><div class="top"></div><div class="bottom"></div></div></div></th>\t\t\t\r\n \t\t\t\t<th><div>Инсталлятор<div class="sorting"><div class="top"></div><div class="bottom"></div></div></div></th>\t\t\t\r\n \t\t\t\t<th><div>Характеристика инстанса<div class="sorting"><div class="top"></div><div class="bottom"></div></div></div></th>\t\t\t\r\n \t\t\t\t<th><div>Статус<div class="sorting"><div class="top"></div><div class="bottom"></div></div></div></th>\t\t\t\r\n \t\t\t\t<th><div>Серверы/Виджеты<div class="sorting"><div class="top"></div><div class="bottom"></div></div></div></th>\t\t\t\r\n \t\t\t\t<th><div>Организации<div class="sorting"><div class="top"></div><div class="bottom"></div></div></div></th>\t\t\t\r\n \t\t\t\t<th><div>Дата и время установки<div class="sorting"><div class="top"></div><div class="bottom"></div></div></div></th>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<td><a href="/">Такси 1</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">Транспортная телематика</a></td>\t\t\t\r\n \t\t\t\t<td>Asymbix 1.22.235 12:21</td>\t\t\t\r\n \t\t\t\t<td><a href="#" class="ok-c">Работает</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">3/4</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">12</a></td>\t\t\t\r\n \t\t\t\t<td><span>12.12.2012</span><span>04:20</span></td>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<td><a href="/">Такси 19</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">Транспортная телематика</a></td>\t\t\t\r\n \t\t\t\t<td>Asymbix 1.22.235 12:21</td>\t\t\t\r\n \t\t\t\t<td><a href="#" class="ok-c">Работает</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">3/8</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">18</a></td>\t\t\t\r\n \t\t\t\t<td><span>12.12.2012</span><span>04:20</span></td>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<td><a href="/">Такси 10</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">Транспортная телематика</a></td>\t\t\t\r\n \t\t\t\t<td>Конфигурация 1.22.235 12:21</td>\t\t\t\r\n \t\t\t\t<td><a href="#" class="error-c">Ошибка</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">2/4</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">24</a></td>\t\t\t\r\n \t\t\t\t<td><span>12.12.2012</span><span>04:20</span></td>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<td><a href="/">Такси 1000</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">Транспортная телематика</a></td>\t\t\t\r\n \t\t\t\t<td>Asymbix 1.22.235 12:21</td>\t\t\t\r\n \t\t\t\t<td><a href="#" class="stop-c">Остановлена</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">2/4</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">24</a></td>\t\t\t\r\n \t\t\t\t<td><span>12.12.2012</span><span>04:20</span></td>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<td><a href="/">Такси 100</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">Транспортная телематика</a></td>\t\t\t\r\n \t\t\t\t<td>Конфигурация 1.22.235 12:21</td>\t\t\t\r\n \t\t\t\t<td><a href="#" class="ok-c">Работает</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">2/4</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">20</a></td>\t\t\t\r\n \t\t\t\t<td><span>12.12.2012</span><span>04:20</span></td>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<td><a href="/">Такси 155</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">Транспортная телематика</a></td>\t\t\t\r\n \t\t\t\t<td>Asymbix 1.22.235 12:21</td>\t\t\t\r\n \t\t\t\t<td><a href="#" class="error-c">Ошибка</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">2/4</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">4</a></td>\t\t\t\r\n \t\t\t\t<td><span>12.12.2012</span><span>04:20</span></td>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<td><a href="/">Такси 125</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">Транспортная телематика</a></td>\t\t\t\r\n \t\t\t\t<td>Конфигурация 1.22.235 12:21</td>\t\t\t\r\n \t\t\t\t<td><a href="#" class="ok-c">Работает</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">2/4</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">4</a></td>\t\t\t\r\n \t\t\t\t<td><span>12.12.2012</span><span>04:20</span></td>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<td><a href="/">Такси 15</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">Транспортная телематика</a></td>\t\t\t\r\n \t\t\t\t<td>Asymbix 1.22.235 12:21</td>\t\t\t\r\n \t\t\t\t<td><a href="#" class="ok-c">Работает</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">12/4</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">1</a></td>\t\t\t\r\n \t\t\t\t<td><span>12.12.2012</span><span>04:20</span></td>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t\t<tr>\t\t\t\t\r\n \t\t\t\t<td><a href="/">Такси 12</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">Транспортная телематика</a></td>\t\t\t\r\n \t\t\t\t<td>Asymbix 1.22.235 12:21а</td>\t\t\t\r\n \t\t\t\t<td><a href="#" class="stop-c">Остановлена</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">2/4</a></td>\t\t\t\r\n \t\t\t\t<td><a href="/">4</a></td>\t\t\t\r\n \t\t\t\t<td><span>12.12.2012</span><span>04:20</span></td>\t\t\t\r\n \t\t\t</tr>\t\t\t\t\r\n \t\t</table>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<!-- end component -->'),
(22, 'testhtml', 'html', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml">\t\t\t\t\t\t\t\r\n<head>\t\t\t\t\t\t\t\r\n<title>Кабинет интегратора - страница 1</title>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng_portal.css" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/style.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/cabinet.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootstrap.css" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/jquery-1.7.2.js"></script>\t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/flexcroll.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap-alert.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript">\t\t\t\t\t\t\t\r\nfunction clickdisplay(objName, a) {\t\t\t\t\t\t\t\r\nvar object = document.getElementById(objName);\t\t\t\t\t\t\t\r\nobject.style.display = (object.style.display == ''none'') ? '''' : ''none''\t\t\t\t\t\t\t\r\n}\t\t\t\t\t\t\t\r\n \t$(document).on(''mouseover'', ''.menu ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".menu ul li").addClass("hover");\t\t\t\t\t\r\n \t}).on(''mouseout'', ''.menu ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".menu ul li").removeClass("hover");\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t$(document).on(''mouseover'', ''.top-menu-c ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".top-menu-c ul li").addClass("hover");\t\t\t\t\t\r\n \t}).on(''mouseout'', ''.top-menu-c ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".top-menu-c ul li").removeClass("hover");\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n<!-- page -->\t\t\t\t\t\t\t\r\n<div class="top-panel">\t\t\t\t\t\t\t\r\n \t<div class="top-content">\t\t\t\t\t\t\r\n \t\t<a class="hide-menu" onclick="clickdisplay(''header'', this), clickdisplay(''logo-small'', this), this.className = (this.className == ''hide-menu top'' ? ''hide-menu'' : ''hide-menu top'')"></a>\t\t\t\t\t\r\n \t\t<a href="/" class="logo-small" id="logo-small" style="display:none;">Assymbix</a>\t\t\t\t\t\r\n \t\t<div class="settings-profile">\t\t\t\t\t\r\n \t\t\t<span><img src="images/default-avatar.png" width="14" height="18" alt="Это Вы" title="Это Вы" /></span>\t\t\t\t\r\n \t\t\t<span>Иванов Иван Иванович</span>\t\t\t\t\r\n \t\t\t<a href="/">Личный кабинет</a>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<div class="page">\t\t\t\t\t\t\t\r\n<!-- header -->\t\t\t\t\t\t\t\r\n<div class="header" id="header">\t\t\t\t\t\t\t\r\n \t<a href="/" class="logo">Assymbix</a>\t\t\t\t\t\t\r\n \t<div class="search-info">\t\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t<span><form action=''/post'' method=''post'' name=''logout''>\t\t\t\t\t\r\n<input name=''action'' type=''hidden'' value=''logout'' />\t\t\t\t\t\t\t\r\nАдминистратор    login4<input name=''logout'' type=''submit'' value=''Logout'' class=''btn btn-success''/>\t\t\t\t\t\t\t\r\n</form> </span>\t\t\t\t\t\t\t\r\n \t\t<input type="text" class="search" value="Поиск" onfocus="if(this.value==this.defaultValue)this.value='''';" onblur="if(this.value=='''')this.value=this.defaultValue;"/>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<div class="menu">\t\t\t\t\t\t\r\n \t\t<ul>\t\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">О проекте</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Правила</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Как это работает</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Платформа</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Новинки платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Особенности платформы</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group"  href="/">Разработчикам</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Исходный код</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Готовые компоненты</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Маркет</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Бесплатные программы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Платные программы</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Новости</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Последние новости</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Важные новости</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/">Аналитика</a></li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Блог</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Свежие посты</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">С плесенью</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/">Форум</a></li>\t\t\t\t\r\n \t\t\t<li><a href="/">Контакты</a></li>\t\t\t\t\r\n \t\t</ul>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end header -->\t\t\t\t\t\t\t\r\n<!-- content cabinet -->\t\t\t\t\t\t\t\r\n<div class="content-c">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="clear"></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end content cabinet -->\t\t\t\t\t\t\t\r\n<div class="end-page"></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end page -->\t\t\t\t\t\t\t\r\n<!-- footer -->\t\t\t\t\t\t\t\r\n<div class="footer">\t\t\t\t\t\t\t\r\n© Все права защиищены. Копирование запрещено. 2012-\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end footer -->\t\t\t\t\t\t\t\r\n<!-- select -->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script>\t\t\t\t\t\t\t\r\n$(function() {\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\tvar select = $(''.style-select'');\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\tselect.each(function() {\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t/**\t\t\t\r\n \t\t\t\t * vars\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\tvar $this = $(this);\t\t\t\r\n \t\t\t\tvar select_main = $(''<div />'', { class: ''select-main'' }).insertAfter(this);\t\t\t\r\n \t\t\t\tvar select_wrap = $(''<div />'', { class: ''select-wrapper'' }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar span = $(''<span />'').appendTo(select_wrap);\t\t\t\r\n \t\t\t\tvar div_button = $(''<div />'').appendTo(select_wrap);\t\t\t\r\n \t\t\t\tvar select_menu = $(''<ul />'', { class: ''select-menu'' }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar input = $(''<input />'', { type: ''hidden'', name: this.name }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar toggler;\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t/** \t\t\t\r\n \t\t\t\t * add css styles по нужной ширине - в зависимости от содержимого присваивается ширина элементу \t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tselect_wrap.css(''height'', $this.height()).add(select_menu).css(''width'',$this.width());\t\t\t\r\n \t\t\t\t$this.css(''display'', ''none'');\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\t/**\t\t\t\r\n \t\t\t\t * create menu\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\tspan.html(this.options[0].innerHTML);\t\t\t\r\n \t\t\t\tinput.attr(''value'', this.options[0].value);\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tfor(var i=0; i < this.options.length; i++) {\t\t\t\r\n \t\t\t\t\t$(''<li />'', { value:this.options[i].value, html: this.options[i].innerHTML }).appendTo(select_menu).click(function() {\t\t\r\n \t\t\t\t\t\tspan.html(this.innerHTML);\t\r\n \t\t\t\t\t\tinput.attr(''value'', this.value);\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\tselect_menu.hide();\t\r\n \t\t\t\t\t\ttoggler = !toggler;\t\r\n \t\t\t\t\t});\t\t\r\n \t\t\t\t}\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tselect_wrap.click(function() {\t\t\t\r\n \t\t\t\t\tif (!toggler) {\t\t\r\n \t\t\t\t\t\tselect_menu.show();\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t} else {\t\t\r\n \t\t\t\t\t\tselect_menu.hide();\t\r\n \t\t\t\t\t}\t\t\r\n \t\t\t\t\ttoggler = !toggler;\t\t\r\n \t\t\t\t});\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t});\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<!-- end select -->\t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>\t\t\t\t\t\t\t\r\n'),
(23, 'main20130508', 'html', '<div style="padding:0 20px;">\t\t\t\t\t\t\t\r\n<div class="slider">&nbsp;</div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- purposes -->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purposes">\t\t\t\t\t\t\t\r\n<div class="purpose">\t\t\t\t\t\t\t\r\n<div class="purpose-content">\t\t\t\t\t\t\t\r\n<h2>Цели</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose-descriptions">телематической платформы</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<ul>\t\t\t\t\t\t\t\r\n \t<li>Terra melico allindra</li>\t\t\t\t\t\t\r\n \t<li>Quello si atre miatro si nostra</li>\t\t\t\t\t\t\r\n \t<li>Reoli ketti cello</li>\t\t\t\t\t\t\r\n \t<li>Aliori allceansa retto</li>\t\t\t\t\t\t\r\n</ul>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose-button"><a class="button-big" href="/">подробнее</a></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose">\t\t\t\t\t\t\t\r\n<div class="purpose-content">\t\t\t\t\t\t\t\r\n<h2>Цели</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose-descriptions">телематич<strong><span style="color:#FF0000;">еской </span></strong>платформы</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<ul>\t\t\t\t\t\t\t\r\n \t<li>Terra melico allindra</li>\t\t\t\t\t\t\r\n \t<li>Quello si atre miatro si nostra</li>\t\t\t\t\t\t\r\n \t<li>Reoli ketti cello</li>\t\t\t\t\t\t\r\n \t<li>Aliori allceansa retto</li>\t\t\t\t\t\t\r\n</ul>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose-button"><a class="button-big" href="/">подробнее</a></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose">\t\t\t\t\t\t\t\r\n<div class="purpose-content">\t\t\t\t\t\t\t\r\n<h2>Цели</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose-descriptions">телематической платформы</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<ul>\t\t\t\t\t\t\t\r\n \t<li>Terra melico allindra</li>\t\t\t\t\t\t\r\n \t<li>Quello si atre miatro si nostra</li>\t\t\t\t\t\t\r\n \t<li>Reoli ketti cello</li>\t\t\t\t\t\t\r\n \t<li>Aliori allceansa retto</li>\t\t\t\t\t\t\r\n</ul>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose-button"><a class="button-big" href="/">подробнее</a></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose">\t\t\t\t\t\t\t\r\n<div class="purpose-content">\t\t\t\t\t\t\t\r\n<h2>Цели</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose-descriptions">телематической платформы</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<ul>\t\t\t\t\t\t\t\r\n \t<li>Terra melico allindra</li>\t\t\t\t\t\t\r\n \t<li>Quello si atre miatro si nostra</li>\t\t\t\t\t\t\r\n \t<li>Reoli ketti cello</li>\t\t\t\t\t\t\r\n \t<li>Aliori allceansa retto</li>\t\t\t\t\t\t\r\n</ul>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="purpose-button"><a class="button-big" href="/">подробнее</a></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end purposes --><!-- main -->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="main"><!-- left -->\t\t\t\t\t\t\t\r\n<div class="left">\t\t\t\t\t\t\t\r\n<div class="info-block">\t\t\t\t\t\t\t\r\n<h2 class="new-market">Новое на маркете</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Новость маркета</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/" style="padding-left:18px; background:url(/images/important-message3.png) 0 0px no-repeat;">Новость о том, что есть маркетинг, о том, что прямо здесь</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/" style="padding-left:13px; background:url(/images/important-message.png) 0 3px no-repeat;">Самая-самая важная новость нашего маркета</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Самая-самая важная новость нашего маркета</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Самая-самая важная новость нашего маркета</a></div>\t\t\t\t\t\t\t\r\n<a class="all" href="/">Весь маркет</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="info-block">\t\t\t\t\t\t\t\r\n<h2 class="news-analitics">Новости аналитики</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/" style="padding-left:18px; background:url(/images/important-message4.png) 0 0px no-repeat;">Последняя новость аналитики</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/" style="padding-left:13px; background:url(/images/important-message1.png) 0 3px no-repeat;">Запись новости о том, что есть запись аналитики, о том, что прямо здесь</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/" style="padding-left:15px; background:url(/images/important-message6.png) 0 1px no-repeat;">Самая-самая важная запись аналитического мышления</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Самая-самая важная новость нашей аналитики</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Самая-самая важная новость нашей аналитики </a></div>\t\t\t\t\t\t\t\r\n<a class="all" href="/">Вся аналитика</a></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end left --><!-- news -->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="center">\t\t\t\t\t\t\t\r\n<div class="news">\t\t\t\t\t\t\t\r\n<div class="new">\t\t\t\t\t\t\t\r\n<h2>Тема новости</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="tools"><span>12.08.2012</span> <a href="/">Комментировать</a> <a href="/">3 комментария</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><a href="/engine"><img alt="" src="http://192.168.30.203/images/1369747827_polina.jpg" style="width: 220px; height: 178px; float: left; margin: 5px;" /></a>Lorem Ipsum - это текст-&quot;рыба&quot;, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной &quot;рыбой&quot; для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.</p>\t\t\t\t\t\t\t\r\n<a class="button-big" href="/">Подробнее</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="new">\t\t\t\t\t\t\t\r\n<h2>Тема новости</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="tools"><span>12.08.2012</span> <a href="/">Комментировать</a> <a href="/">3 комментария</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><img alt="lorem ipsum" src="/images/img.jpg" title="lorem ipsum" /></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>Lorem Ipsum - это текст-&quot;рыба&quot;, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной &quot;рыбой&quot; для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн.</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><img alt="" src="http://192.168.30.203/images/1369812164_emerging-markets_43706983.jpg" style="width: 450px; height: 338px;" /></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>&nbsp;</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><img alt="" src="http://promo/images/1379430396_df209.jpg" style="width: 180px; height: 180px;" /></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.</p>\t\t\t\t\t\t\t\r\n<a class="button-big" href="/">Подробнее</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="new">\t\t\t\t\t\t\t\r\n<h2>Тема новости</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="tools"><span>12.08.2012</span> <a href="/">Комментировать</a> <a href="/">3 комментария</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>Lorem Ipsum - это текст-&quot;рыба&quot;, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной &quot;рыбой&quot; для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.</p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p><img alt="" src="/images/1369380200_1369122414_40749-133035-bccae97ca7ac7d876b280980cc26d1f4.jpg" style="width: 375px; height: 258px;" /></p>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<p>&nbsp;</p>\t\t\t\t\t\t\t\r\n<a class="button-big" href="/">Подробнее</a> <a class="all" href="/">Архив новостей</a>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="clear">&nbsp;</div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end center --><!-- right -->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="right">\t\t\t\t\t\t\t\r\n<div class="info-block">\t\t\t\t\t\t\t\r\n<h2 class="blog">Блог</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Запись блога</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/" style="padding-left:10px; background:url(/images/important-message2.png) 0 2px no-repeat;">Запись блога о том, что есть запись блога, о том, что прямо здесь</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/" style="padding-left:13px; background:url(/images/important-message5.png) 0 0px no-repeat;">Самая-самая важная запись нашего супер-пупер блога</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Самая-самая важная новость нашего супер-пупер блога</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Самая-самая важная новость нашего супер-пупер блога</a></div>\t\t\t\t\t\t\t\r\n<a class="all" href="/">Весь блог</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="info-block">\t\t\t\t\t\t\t\r\n<h2 class="forum">Форум</h2>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012 <span>12:12</span> <a href="/">Pipkin</a></div>\t\t\t\t\t\t\t\r\n<a href="/">Последняя запись с форума</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Запись с форума о том, что есть запись с форума, о том, что прямо здесь</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Самая-самая важная запись нашего супер-пупер форума</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Самая-самая важная новость нашего супер-пупер форума</a></div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div>\t\t\t\t\t\t\t\r\n<div class="date">12.08.2012</div>\t\t\t\t\t\t\t\r\n<a href="/">Самая-самая важная новость нашего супер-пупер форума</a></div>\t\t\t\t\t\t\t\r\n<a class="all" href="/">Весь форум</a></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end-right --></div>\t\t\t\t\t\t\t\r\n<!-- end-main -->'),
(30, 'postuserid', 'php', '$this->formdata[''POST''][''author''] = $_SESSION[''user_id''];\t\t\t\t\t\t\t\r\n$this->formdata[''POST''][''uid''] = $_SESSION[''user_id''];\t\t\t\t\t\t\t\r\n$this->formdata[''POST''][''comment''] = str_replace(chr(10), ''<br />'', $this->formdata[''POST''][''comment'']);\t\t\t\t\t\t\t\r\n//echo ''++++++++++++++'';'),
(31, 'testecho', 'php', 'echo "123\r\n456\r\nqwer";');

-- 
-- Вывод данных для таблицы sys_temps
--
INSERT INTO sys_temps VALUES
(2, '[>content<]', 'plain', 'page'),
(3, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml">\t\t\t\t\t\t\t\r\n<head>\t\t\t\t\t\t\t\r\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\t\t\t\t\t\t\t\r\n<title>[>title<]</title>\t\t\t\t\t\t\t\r\n<meta name="description" content="[>description<]" />\t\t\t\t\t\t\t\r\n<meta name="Keywords" content="[>keywords<]" />\t\t\t\t\t\t\t\r\n<!--\t\t\t\t\t\t\t\r\n[>noindex<]\t\t\t\t\t\t\t\r\n-->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng01.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootstrap.css" />\t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-1.7.2.min.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap-alert.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/partial.js"></script>\t\t\t\t\t\t\t\r\n<script src="/ckeditor/ckeditor.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_form_direct.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<!--\t\t\t\t\t\t\t\r\n<script src="/js/go_swap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_sel.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_zal.js"></script>\t\t\t\t\t\t\t\r\n-->\t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="frm00" id="ales_log">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="maindiv">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="parts h400" id="login" align="center">\t\t\t\t\t\t\t\r\n[>content<]\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>', 'login', 'page'),
(4, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml">\t\t\t\t\t\t\t\r\n<head>\t\t\t\t\t\t\t\r\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\t\t\t\t\t\t\t\r\n<title>[>title<]</title>\t\t\t\t\t\t\t\r\n<meta name="description" content="[>description<]" />\t\t\t\t\t\t\t\r\n<meta name="Keywords" content="[>keywords<]" />\t\t\t\t\t\t\t\r\n<!--\t\t\t\t\t\t\t\r\n[>noindex<]\t\t\t\t\t\t\t\r\n-->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng01_test.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootstrap.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/elrte-1.3/css/smoothness/jquery-ui-1.8.7.custom.css" type="text/css" media="screen" charset="utf-8">\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/elrte-1.3/css/elrte.min.css" type="text/css" media="screen" charset="utf-8">\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-1.7.2.min.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/elrte-1.3/js/elrte.min.js" type="text/javascript" charset="utf-8"></script>\t\t\t\t\t\t\t\r\n<script src="/elrte-1.3/js/i18n/elrte.ru.js" type="text/javascript" charset="utf-8"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/bootstrap-alerts.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/partial.js"></script>\t\t\t\t\t\t\t\r\n<script src="/ckeditor/ckeditor.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_form_direct.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="frm00" id="ales">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="header h100">\t\t\t\t\t\t\t\r\n  <a href="/"><img src="/imag/buttons/round90blue90.gif" width="90" height="90" /></a>\t\t\t\t\t\t\t\r\n  <div class="frm00 aright h100">[>loginout<]</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="maindiv">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="parts w228">[>button01<]</div>\t\t\t\t\t\t\t\r\n<div class="parts w228">[>button02<]</div>\t\t\t\t\t\t\t\r\n<div class="parts w228">[>button03<]</div>\t\t\t\t\t\t\t\r\n<div class="parts w228" id="clocks">[>button04<]</div>\t\t\t\t\t\t\t\r\n<div class="parts w942">[>content<]</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="footer h50">\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>', 'test', 'page'),
(5, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml">\t\t\t\t\t\t\t\r\n<head>\t\t\t\t\t\t\t\r\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\t\t\t\t\t\t\t\r\n<title>[>title<]</title>\t\t\t\t\t\t\t\r\n<meta name="description" content="[>description<]" />\t\t\t\t\t\t\t\r\n<meta name="Keywords" content="[>keywords<]" />\t\t\t\t\t\t\t\r\n<!--\t\t\t\t\t\t\t\r\n[>noindex<]\t\t\t\t\t\t\t\r\n-->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng01_test.css" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/elrte-1.3/css/smoothness/jquery-ui-1.8.7.custom.css" type="text/css" media="screen" charset="utf-8">\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/elrte-1.3/css/elrte.min.css" type="text/css" media="screen" charset="utf-8">\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-1.7.2.min.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/elrte-1.3/js/elrte.min.js" type="text/javascript" charset="utf-8"></script>\t\t\t\t\t\t\t\r\n<script src="/elrte-1.3/js/i18n/elrte.ru.js" type="text/javascript" charset="utf-8"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/partial.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_form_direct.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="frm00" id="ales">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="header h100">\t\t\t\t\t\t\t\r\n  <a href="/"><img src="/imag/buttons/round90blue90.gif" width="90" height="90" /></a>\t\t\t\t\t\t\t\r\n  <div class="frm00 aright h100">[>loginout<]</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="maindiv">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="parts w228">[>button01<]</div>\t\t\t\t\t\t\t\r\n<div class="parts w228">[>button02<]</div>\t\t\t\t\t\t\t\r\n<div class="parts w228">[>button03<]</div>\t\t\t\t\t\t\t\r\n<div class="parts w228" id="clocks">[>button04<]</div>\t\t\t\t\t\t\t\r\n<div class="parts w942">[>content<]</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="footer h50">\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>', 'clrte', 'page'),
(6, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml">\t\t\t\t\t\t\t\r\n<head>\t\t\t\t\t\t\t\r\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\t\t\t\t\t\t\t\r\n<title>[>title<]</title>\t\t\t\t\t\t\t\r\n<!--\t\t\t\t\t\t\t\r\n[>noindex<]\t\t\t\t\t\t\t\r\n-->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/brow.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootstrap.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootsnew.css" />\t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-1.7.2.min.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap-alert.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/partial.js"></script>\t\t\t\t\t\t\t\r\n<script src="/ckeditor/ckeditor.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_form_direct.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<!--\t\t\t\t\t\t\t\r\n<script src="/js/go_swap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_sel.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_zal.js"></script>\t\t\t\t\t\t\t\r\n-->\t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n[>content<]\t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>', 'simple', 'page'),
(7, '<div class="comment comlevel[>lvl<]">\t\t\t\t\t\t\t\r\n<div class="comdiv" id=''[>id<]''>\t\t\t\t\t\t\t\r\n<div class="comuinfo">\t\t\t\t\t\t\t\r\n<img src="[>upic<]" /><br />\t\t\t\t\t\t\t\r\n<a href="[>userinfo<]">[>username<]</a>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n[>commentext<]\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<p class=''replylink''>Reply</p>\t\t\t\t\t\t\t\r\n</div>', 'main', 'comment'),
(8, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml">\t\t\t\t\t\t\t\r\n<head>\t\t\t\t\t\t\t\r\n<title>Кабинет интегратора - страница 1</title>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng_portal.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/style.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootstrap.css" />\t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/jquery-1.7.2.js"></script>\t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/flexcroll.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap-alert.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/partial.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_form_direct.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript">\t\t\t\t\t\t\t\r\nfunction clickdisplay(objName, a) {\t\t\t\t\t\t\t\r\nvar object = document.getElementById(objName);\t\t\t\t\t\t\t\r\nobject.style.display = (object.style.display == ''none'') ? '''' : ''none''\t\t\t\t\t\t\t\r\n}\t\t\t\t\t\t\t\r\n \t$(document).on(''mouseover'', ''.menu ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".menu ul li").addClass("hover");\t\t\t\t\t\r\n \t}).on(''mouseout'', ''.menu ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".menu ul li").removeClass("hover");\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t$(document).on(''mouseover'', ''.top-menu-c ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".top-menu-c ul li").addClass("hover");\t\t\t\t\t\r\n \t}).on(''mouseout'', ''.top-menu-c ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".top-menu-c ul li").removeClass("hover");\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n<!-- page -->\t\t\t\t\t\t\t\r\n<div class="top-panel">\t\t\t\t\t\t\t\r\n \t<div class="top-content">\t\t\t\t\t\t\r\n \t\t<a class="hide-menu" onclick="clickdisplay(''header'', this), clickdisplay(''logo-small'', this), this.className = (this.className == ''hide-menu top'' ? ''hide-menu'' : ''hide-menu top'')"></a>\t\t\t\t\t\r\n \t\t<a href="/" class="logo-small" id="logo-small" style="display:none;">Assymbix</a>\t\t\t\t\t\r\n \t\t<div class="settings-profile">\t\t\t\t\t\r\n \t\t\t<span><img src="images/default-avatar.png" width="14" height="18" alt="Это Вы" title="Это Вы" /></span>\t\t\t\t\r\n \t\t\t<span>Иванов Иван Иванович</span>\t\t\t\t\r\n \t\t\t<a href="/">Личный кабинет</a>\t\t\t\t\r\n \t\t\t<a href="/"></a>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<div class="page">\t\t\t\t\t\t\t\r\n<!-- header -->\t\t\t\t\t\t\t\r\n<div class="header" id="header">\t\t\t\t\t\t\t\r\n \t<a href="/" class="logo">Assymbix</a>\t\t\t\t\t\t\r\n \t<div class="search-info">\t\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t<input type="text" class="search" value="Поиск" onfocus="if(this.value==this.defaultValue)this.value='''';" onblur="if(this.value=='''')this.value=this.defaultValue;"/>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<div class="menu">\t\t\t\t\t\t\r\n \t\t<ul>\t\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">О проекте</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Правила</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Как это работает</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Платформа</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Новинки платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Особенности платформы</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group"  href="/">Разработчикам</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Исходный код</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Готовые компоненты</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Маркет</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Бесплатные программы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Платные программы</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Новости</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Последние новости</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Важные новости</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/">Аналитика</a></li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Блог</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Свежие посты</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">С плесенью</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/">Форум</a></li>\t\t\t\t\r\n \t\t\t<li><a href="/">Контакты</a></li>\t\t\t\t\r\n \t\t</ul>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end header -->\t\t\t\t\t\t\t\r\n<!-- content cabinet -->\t\t\t\t\t\t\t\r\n<div class="content-c">\t\t\t\t\t\t\t\r\n[>content<]\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="clear"></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end content cabinet -->\t\t\t\t\t\t\t\r\n<div class="end-page"></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end page -->\t\t\t\t\t\t\t\r\n<!-- footer -->\t\t\t\t\t\t\t\r\n<div class="footer">\t\t\t\t\t\t\t\r\n&#169 Все права защиищены. Копирование запрещено. 2012-[>year<]\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end footer -->\t\t\t\t\t\t\t\r\n<!-- select -->\t\t\t\t\t\t\t\r\n<script>\t\t\t\t\t\t\t\r\n$(function() {\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\tvar select = $(''.style-select'');\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\tselect.each(function() {\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t/**\t\t\t\r\n \t\t\t\t * vars\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\tvar $this = $(this);\t\t\t\r\n \t\t\t\tvar select_main = $(''<div />'', { class: ''select-main'' }).insertAfter(this);\t\t\t\r\n \t\t\t\tvar select_wrap = $(''<div />'', { class: ''select-wrapper'' }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar span = $(''<span />'').appendTo(select_wrap);\t\t\t\r\n \t\t\t\tvar div_button = $(''<div />'').appendTo(select_wrap);\t\t\t\r\n \t\t\t\tvar select_menu = $(''<ul />'', { class: ''select-menu'' }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar input = $(''<input />'', { type: ''hidden'', name: this.name }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar toggler;\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t/** \t\t\t\r\n \t\t\t\t * add css styles по нужной ширине - в зависимости от содержимого присваивается ширина элементу \t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tselect_wrap.css(''height'', $this.height()).add(select_menu).css(''width'',$this.width());\t\t\t\r\n \t\t\t\t$this.css(''display'', ''none'');\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\t/**\t\t\t\r\n \t\t\t\t * create menu\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\tspan.html(this.options[0].innerHTML);\t\t\t\r\n \t\t\t\tinput.attr(''value'', this.options[0].value);\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tfor(var i=0; i < this.options.length; i++) {\t\t\t\r\n \t\t\t\t\t$(''<li />'', { value:this.options[i].value, html: this.options[i].innerHTML }).appendTo(select_menu).click(function() {\t\t\r\n \t\t\t\t\t\tspan.html(this.innerHTML);\t\r\n \t\t\t\t\t\tinput.attr(''value'', this.value);\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\tselect_menu.hide();\t\r\n \t\t\t\t\t\ttoggler = !toggler;\t\r\n \t\t\t\t\t});\t\t\r\n \t\t\t\t}\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tselect_wrap.click(function() {\t\t\t\r\n \t\t\t\t\tif (!toggler) {\t\t\r\n \t\t\t\t\t\tselect_menu.show();\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t} else {\t\t\r\n \t\t\t\t\t\tselect_menu.hide();\t\r\n \t\t\t\t\t}\t\t\r\n \t\t\t\t\ttoggler = !toggler;\t\t\r\n \t\t\t\t});\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t});\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- end select -->\t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>', 'portlog', 'page'),
(9, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml">\t\t\t\t\t\t\t\r\n<head>\t\t\t\t\t\t\t\r\n<title>[>title<]</title>\t\t\t\t\t\t\t\r\n<meta name="description" content="[>description<]" />\t\t\t\t\t\t\t\r\n<meta name="Keywords" content="[>keywords<]" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n[>noindex<]\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng_portal.css" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/style.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootstrap.css" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/jquery-1.7.2.js"></script>\t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/flexcroll.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap-alert.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/partial.js"></script>\t\t\t\t\t\t\t\r\n<script src="/ckeditor/ckeditor.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_form_direct.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript">\t\t\t\t\t\t\t\r\nfunction clickdisplay(objName, a) {\t\t\t\t\t\t\t\r\nvar object = document.getElementById(objName);\t\t\t\t\t\t\t\r\nobject.style.display = (object.style.display == ''none'') ? '''' : ''none''\t\t\t\t\t\t\t\r\n}\t\t\t\t\t\t\t\r\n \t$(document).on(''mouseover'', ''.menu ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".menu ul li").addClass("hover");\t\t\t\t\t\r\n \t}).on(''mouseout'', ''.menu ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".menu ul li").removeClass("hover");\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t$(document).on(''mouseover'', ''.top-menu-c ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".top-menu-c ul li").addClass("hover");\t\t\t\t\t\r\n \t}).on(''mouseout'', ''.top-menu-c ul li'' , function(e){\t\t\t\t\t\t\r\n \t\t$(".top-menu-c ul li").removeClass("hover");\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n<!-- page -->\t\t\t\t\t\t\t\r\n<div class="top-panel">\t\t\t\t\t\t\t\r\n \t<div class="top-content">\t\t\t\t\t\t\r\n \t\t<a class="hide-menu" onclick="clickdisplay(''header'', this), clickdisplay(''logo-small'', this), this.className = (this.className == ''hide-menu top'' ? ''hide-menu'' : ''hide-menu top'')"></a>\t\t\t\t\t\r\n \t\t<a href="/" class="logo-small" id="logo-small" style="display:none;">Assymbix</a>\t\t\t\t\t\r\n \t\t<div class="settings-profile">\t\t\t\t\t\r\n \t\t\t<span>[>loginout<] </span>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<div class="page">\t\t\t\t\t\t\t\r\n<!-- header -->\t\t\t\t\t\t\t\r\n<div class="header" id="header">\t\t\t\t\t\t\t\r\n \t<a href="/" class="logo">Assymbix</a>\t\t\t\t\t\t\r\n \t<div class="search-info">\t\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t<input type="text" class="search" value="Поиск" onfocus="if(this.value==this.defaultValue)this.value='''';" onblur="if(this.value=='''')this.value=this.defaultValue;"/>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<div class="menu">\t\t\t\t\t\t\r\n \t\t<ul>\t\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">О проекте</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Правила</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Как это работает</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Платформа</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Новинки платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Особенности платформы</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group"  href="/">Разработчикам</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Исходный код</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Готовые компоненты</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Маркет</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Бесплатные программы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Платные программы</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Новости</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Последние новости</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Важные новости</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/">Аналитика</a></li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Блог</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Свежие посты</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">С плесенью</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/">Форум</a></li>\t\t\t\t\r\n \t\t\t<li><a href="/">Контакты</a></li>\t\t\t\t\r\n \t\t</ul>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end header -->\t\t\t\t\t\t\t\r\n<!-- content cabinet -->\t\t\t\t\t\t\t\r\n<div class="content-c">\t\t\t\t\t\t\t\r\n[>content<]\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<div class="clear"></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end content cabinet -->\t\t\t\t\t\t\t\r\n<div class="end-page"></div>\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end page -->\t\t\t\t\t\t\t\r\n<!-- footer -->\t\t\t\t\t\t\t\r\n<div class="footer">\t\t\t\t\t\t\t\r\n&#169 Все права защиищены. Копирование запрещено. 2012-[>year<]\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end footer -->\t\t\t\t\t\t\t\r\n<!-- select -->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script>\t\t\t\t\t\t\t\r\n$(function() {\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\tvar select = $(''.style-select'');\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\tselect.each(function() {\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t/**\t\t\t\r\n \t\t\t\t * vars\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\tvar $this = $(this);\t\t\t\r\n \t\t\t\tvar select_main = $(''<div />'', { class: ''select-main'' }).insertAfter(this);\t\t\t\r\n \t\t\t\tvar select_wrap = $(''<div />'', { class: ''select-wrapper'' }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar span = $(''<span />'').appendTo(select_wrap);\t\t\t\r\n \t\t\t\tvar div_button = $(''<div />'').appendTo(select_wrap);\t\t\t\r\n \t\t\t\tvar select_menu = $(''<ul />'', { class: ''select-menu'' }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar input = $(''<input />'', { type: ''hidden'', name: this.name }).appendTo(select_main);\t\t\t\r\n \t\t\t\tvar toggler;\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t/** \t\t\t\r\n \t\t\t\t * add css styles по нужной ширине - в зависимости от содержимого присваивается ширина элементу \t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tselect_wrap.css(''height'', $this.height()).add(select_menu).css(''width'',$this.width());\t\t\t\r\n \t\t\t\t$this.css(''display'', ''none'');\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\t/**\t\t\t\r\n \t\t\t\t * create menu\t\t\t\r\n \t\t\t\t */\t\t\t\r\n \t\t\t\tspan.html(this.options[0].innerHTML);\t\t\t\r\n \t\t\t\tinput.attr(''value'', this.options[0].value);\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tfor(var i=0; i < this.options.length; i++) {\t\t\t\r\n \t\t\t\t\t$(''<li />'', { value:this.options[i].value, html: this.options[i].innerHTML }).appendTo(select_menu).click(function() {\t\t\r\n \t\t\t\t\t\tspan.html(this.innerHTML);\t\r\n \t\t\t\t\t\tinput.attr(''value'', this.value);\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\tselect_menu.hide();\t\r\n \t\t\t\t\t\ttoggler = !toggler;\t\r\n \t\t\t\t\t});\t\t\r\n \t\t\t\t}\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\tselect_wrap.click(function() {\t\t\t\r\n \t\t\t\t\tif (!toggler) {\t\t\r\n \t\t\t\t\t\tselect_menu.show();\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t} else {\t\t\r\n \t\t\t\t\t\tselect_menu.hide();\t\r\n \t\t\t\t\t}\t\t\r\n \t\t\t\t\ttoggler = !toggler;\t\t\r\n \t\t\t\t});\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t});\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<!-- end select -->\t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>', 'portal', 'page'),
(10, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml">\t\t\t\t\t\t\t\r\n<head>\t\t\t\t\t\t\t\r\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\t\t\t\t\t\t\t\r\n<title>[>title<]</title>\t\t\t\t\t\t\t\r\n<meta name="description" content="[>description<]" />\t\t\t\t\t\t\t\r\n<meta name="Keywords" content="[>keywords<]" />\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n[>noindex<]\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng_portal.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/style.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/jquery-1.7.2.js"></script>\t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/flexcroll.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap-alert.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/partial.js"></script>\t\t\t\t\t\t\t\r\n<script src="/ckeditor/ckeditor.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_form_direct.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript">\t\t\t\t\t\t\t\r\nfunction clickdisplay(objName, a) {\t\t\t\t\t\t\t\r\nvar object = document.getElementById(objName);\t\t\t\t\t\t\t\r\nobject.style.display = (object.style.display == ''none'') ? '''' : ''none''\t\t\t\t\t\t\t\r\n}\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- кнопка вверх -->\t\t\t\t\t\t\t\r\n<script>\t\t\t\t\t\t\t\r\n$(function(){\t\t\t\t\t\t\t\r\n  $.fn.scrollToTop=function(){\t\t\t\t\t\t\t\r\n    $(this).hide().removeAttr("href");\t\t\t\t\t\t\t\r\n    if($(window).scrollTop()!="0"){\t\t\t\t\t\t\t\r\n        $(this).fadeIn("slow")\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n  var scrollDiv=$(this);\t\t\t\t\t\t\t\r\n  $(window).scroll(function(){\t\t\t\t\t\t\t\r\n    if($(window).scrollTop()=="0"){\t\t\t\t\t\t\t\r\n    $(scrollDiv).fadeOut("slow")\t\t\t\t\t\t\t\r\n    }else{\t\t\t\t\t\t\t\r\n    $(scrollDiv).fadeIn("slow")\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n  });\t\t\t\t\t\t\t\r\n    $(this).click(function(){\t\t\t\t\t\t\t\r\n      $("html, body").animate({scrollTop:0},"slow")\t\t\t\t\t\t\t\r\n    })\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n$(function() {$("#go-top").scrollToTop();});\t\t\t\t\t\t\t\r\n$(function() {\t\t\t\t\t\t\t\r\n    $(window).resize(function() {\t\t\t\t\t\t\t\r\n        var width = $(window).outerWidth();\t\t\t\t\t\t\t\r\n        if (width < 1380) {\t\t\t\t\t\t\t\r\n            $("#go-top").addClass("go-top");\t\t\t\t\t\t\t\r\n        } else {\t\t\t\t\t\t\t\r\n            $("#go-top").removeClass("go-top");\t\t\t\t\t\t\t\r\n        }\t\t\t\t\t\t\t\r\n    });\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t$(window).resize();\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- end кнопка вверх -->\t\t\t\t\t\t\t\r\n<!-- плавное раскрытие и скрытие -->\t\t\t\t\t\t\t\r\n<script language="javascript">\t\t\t\t\t\t\t\r\n$(document).ready(function(){\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t$(".slide-extremum").hover(function(){\t\t\t\t\t\t\r\n \t\t$(".slide-extremum>.extremum").slideToggle("slow");\t\t\t\t\t\r\n \t\t$(this).toggleClass("active"); return false;\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t \t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- end плавное раскрытие и скрытие -->\t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n<!-- page -->\t\t\t\t\t\t\t\r\n<div class="top-panel">\t\t\t\t\t\t\t\r\n \t<div class="top-content">\t\t\t\t\t\t\r\n \t\t<a class="hide-menu" style="display:none;" onclick="clickdisplay(''header'', this), clickdisplay(''logo-small'', this), this.className = (this.className == ''hide-menu top'' ? ''hide-menu'' : ''hide-menu top'')"></a>\t\t\t\t\t\r\n \t\t<a href="/" class="logo-small" id="logo-small" style="display:none;">Assymbix</a>\t\t\t\t\t\r\n \t\t<div class="settings-profile">\t\t\t\t\t\r\n \t\t\t<span><img src="/images/default-avatar.png" width="14" height="18" alt="Это Вы" title="Это Вы" style="align:left;"/>[>loginout<]</span>\t\t\t\t\r\n \t\t\t<div class="slide-extremum">\t\t\t\t\r\n \t\t\t\t<a href="/" class="language"></a>\t\t\t\r\n \t\t\t\t<ul class="extremum">\t\t\t\r\n \t\t\t\t\t<li><a href="#" class="active">Русский</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">English</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</div>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<div class="page">\t\t\t\t\t\t\t\r\n<!-- header -->\t\t\t\t\t\t\t\r\n<div class="header" id="header">\t\t\t\t\t\t\t\r\n \t<a href="/" class="logo">Assymbix</a>\t\t\t\t\t\t\r\n \t<div class="search-info">\t\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t<span class="header-phone">8 (123) 123 123 123</span>\t\t\t\t\t\r\n \t\t<input type="text" class="search" value="Поиск" onfocus="if(this.value==this.defaultValue)this.value='''';" onblur="if(this.value=='''')this.value=this.defaultValue;"/>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<div class="menu">\t\t\t\t\t\t\r\n \t\t<ul>\t\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">О проекте</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Принципы проекта</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Платформа</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Сообщество</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Ко-маркетинг</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Маркет</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Перспективы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Ключевые достижения</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Участники</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Платформа</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Структура платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Свойства платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Применение платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Безопасность платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Безопасность облаков</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Прикладная система</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group"  href="/">Разработчикам</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Техническое описание и стандарты платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Техническое описание прикладной системы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Документация для разработчиков</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Шаблоны и примеры</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Тестовая среда</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Маркет</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">AVL</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">SW компоненты</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">HW компоненты</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">SW решения</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Коробочные решения</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Услуги</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Исследования</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Правила работы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Правила размещения товаров/услуг</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Новости</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Новости отрасли</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Новости проекта</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Новости участников</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Объявления</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/" class="group">Аналитика</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Аналитика рыночная</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Аналитика технологическая</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Блог</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Редакционные статьи</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Персональные блоги</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Блоги ключевых партнеров</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Блоги приглашенных спикеров</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="[{omniforum}]">Форум</a></li>\t\t\t\t\r\n \t\t\t<li><a href="/">Контакты</a></li>\t\t\t\t\r\n \t\t</ul>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end header -->\t\t\t\t\t\t\t\r\n<!-- content -->\t\t\t\t\t\t\t\r\n<div class="content">\t\t\t\t\t\t\t\r\n[>content<]\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end content -->\t\t\t\t\t\t\t\r\n \t<!-- footer -->\t\t\t\t\t\t\r\n \t<div class="footer">\t\t\t\t\t\t\r\n \t\t<a href="#" id="go-top"></a>\t\t\t\t\t\r\n \t\t<div class="footer-left">\t\t\t\t\t\r\n \t\t\tAscatel Inc., Holding Company <span>901 North Pitt Street, Suite 325, <br> Alexandria, VA 22314, USA</span>\t\t\t\t\r\n \t\t\tВсе права защищены\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t\t<div class="footer-center">\t\t\t\t\t\r\n \t\t\t<img src="/images/footer-logo.png" alt="Проект Asymbix" title="Проект Asymbix" />\t\t\t\t\r\n \t\t\t<span>ЗДЕСЬ УКАЗЫВАЕТСЯ НАЗВАНИЕ СЛУЖБЫ И ЕЕ ТЕЛЕФОН</span>\t\t\t\t\r\n \t\t\t<span>E-mail: <a href="mailto:info@ascatel.com">info@ascatel.com</a></span><span>Tel.: 1.202.835.0966</span>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t\t<div class="footer-right">\t\t\t\t\t\r\n \t\t\t<a href="" class="footer-questions">Хотите задать вопрос?</a>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<!-- end footer -->\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end page -->\t\t\t\t\t\t\t\r\n \t<div class="footer-sitemap">\t\t\t\t\t\t\r\n \t\t<div>\t\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">О проекте</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Принципы проекта</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Платформа</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Сообщество</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Ко-маркетинг</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Маркет</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Перспективы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Ключевые достижения</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Участники</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Платформа</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Структура платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Свойства платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Применения платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Безопасность платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Безопасность облаков</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Прикладная система</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Разработчикам</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Техническое описание и стандарты платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Техническое описание прикладной системы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Документация для разработчиков</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Шаблоны и примеры</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Тестовая среда</a></li>   \t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Маркет</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">AVL</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">SW компоненты</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">HW компоненты</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">SW решения</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Коробочные решения</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Услуги</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Исследования</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Правила работы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Правила размещения товаров / услуг</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Новости</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Новости отрасли</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Новости проекта</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Новости участников</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Объявления</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Аналитика</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Аналитика рыночная</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Аналитика технологическая</a></li> \t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Блог</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Редакционные статьи</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Персональные блоги</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Блоги ключевых партнеров</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Блоги приглашенных спикеров</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Форум</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Контакты</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n<!-- IE -->\t\t\t\t\t\t\t\r\n<div class="ie">\t\t\t\t\t\t\t\r\nВаш браузер морально и физически изношен. Для просмотра сайта установите новую версию браузера.\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end IE -->\t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>', 'portal20130508', 'page'),
(12, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml"><head>\t\t\t\t\t\t\t\r\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\t\t\t\t\t\t\t\r\n<title>[>title<]</title>\t\t\t\t\t\t\t\r\n<meta name="description" content="[>description<]" />\t\t\t\t\t\t\t\r\n<meta name="Keywords" content="[>keywords<]" />\t\t\t\t\t\t\t\r\n[>noindex<]\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng_portal.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootstrap.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/style_forum.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/cabinet.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootsnew.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/jquery-1.7.2.js"></script>\t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/flexcroll.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap-alert.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/partial.js"></script>\t\t\t\t\t\t\t\r\n<script src="/ckeditor/ckeditor.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_form_direct.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript">\t\t\t\t\t\t\t\r\nfunction clickdisplay(objName, a) {\t\t\t\t\t\t\t\r\nvar object = document.getElementById(objName);\t\t\t\t\t\t\t\r\nobject.style.display = (object.style.display == ''none'') ? '''' : ''none''\t\t\t\t\t\t\t\r\n}\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- кнопка вверх -->\t\t\t\t\t\t\t\r\n<script>\t\t\t\t\t\t\t\r\n$(function(){\t\t\t\t\t\t\t\r\n  $.fn.scrollToTop=function(){\t\t\t\t\t\t\t\r\n    $(this).hide().removeAttr("href");\t\t\t\t\t\t\t\r\n    if($(window).scrollTop()!="0"){\t\t\t\t\t\t\t\r\n        $(this).fadeIn("slow")\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n  var scrollDiv=$(this);\t\t\t\t\t\t\t\r\n  $(window).scroll(function(){\t\t\t\t\t\t\t\r\n    if($(window).scrollTop()=="0"){\t\t\t\t\t\t\t\r\n    $(scrollDiv).fadeOut("slow")\t\t\t\t\t\t\t\r\n    }else{\t\t\t\t\t\t\t\r\n    $(scrollDiv).fadeIn("slow")\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n  });\t\t\t\t\t\t\t\r\n    $(this).click(function(){\t\t\t\t\t\t\t\r\n      $("html, body").animate({scrollTop:0},"slow")\t\t\t\t\t\t\t\r\n    })\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n$(function() {$("#go-top").scrollToTop();});\t\t\t\t\t\t\t\r\n$(function() {\t\t\t\t\t\t\t\r\n    $(window).resize(function() {\t\t\t\t\t\t\t\r\n        var width = $(window).outerWidth();\t\t\t\t\t\t\t\r\n        if (width < 1380) {\t\t\t\t\t\t\t\r\n            $("#go-top").addClass("go-top");\t\t\t\t\t\t\t\r\n        } else {\t\t\t\t\t\t\t\r\n            $("#go-top").removeClass("go-top");\t\t\t\t\t\t\t\r\n        }\t\t\t\t\t\t\t\r\n    });\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t$(window).resize();\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- end кнопка вверх -->\t\t\t\t\t\t\t\r\n<!-- плавное раскрытие и скрытие -->\t\t\t\t\t\t\t\r\n<script language="javascript">\t\t\t\t\t\t\t\r\n$(document).ready(function(){\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t$(".slide-extremum").hover(function(){\t\t\t\t\t\t\r\n \t\t$(".slide-extremum>.extremum").slideToggle("slow");\t\t\t\t\t\r\n \t\t$(this).toggleClass("active"); return false;\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t \t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- end плавное раскрытие и скрытие -->\t\t\t\t\t\t\t\r\n<!-- плавное раскрытие и скрытие блок документов для скачивания -->\t\t\t\t\t\t\t\r\n<script language="javascript">\t\t\t\t\t\t\t\r\n$(document).ready(function(){\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t$(".slide-extremum-click h2").click(function(){\t\t\t\t\t\t\r\n \t\t$(".slide-extremum-click>.extremum-click").slideToggle("slow");\t\t\t\t\t\r\n \t\t$(this).toggleClass("active"); return false;\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t$(".slide-extremum-click1 h2").click(function(){\t\t\t\t\t\t\r\n \t\t$(".slide-extremum-click1>.extremum-click").slideToggle("slow");\t\t\t\t\t\r\n \t\t$(this).toggleClass("active"); return false;\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t \t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- end плавное раскрытие и скрытие \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<span><img src="/images/default-avatar.png" width="14" height="18" alt="Это Вы" title="Это Вы" style="align:left;"/>[>loginout<]</span>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n-->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n<!-- page -->\t\t\t\t\t\t\t\r\n<div class="top-panel">\t\t\t\t\t\t\t\r\n \t<div class="top-content internal">\t\t\t\t\t\t\r\n \t\t<a href="/" class="logo-medium" id="logo-medium">Assymbix</a>\t\t\t\t\t\r\n \t\t<div class="settings-profile">\t\t\t\t\t\r\n \t\t\t<span><img src="/images/default-avatar.png" width="14" height="18" alt="Это Вы" title="Это Вы" style="align:left;"/>[>loginout<]</span>\t\t\t\t\r\n \t\t\t<div class="slide-extremum">\t\t\t\t\r\n \t\t\t\t<a href="/" class="language"></a>\t\t\t\r\n \t\t\t\t<ul class="extremum">\t\t\t\r\n \t\t\t\t\t<li><a href="#" class="active">Русский</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">English</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</div>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<div class="page internal">\t\t\t\t\t\t\t\r\n<!-- header -->\t\t\t\t\t\t\t\r\n<div class="header" id="header">\t\t\t\t\t\t\t\r\n \t<div class="menu">\t\t\t\t\t\t\r\n \t\t<ul>\t\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">О проекте</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Принципы проекта</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Платформа</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Сообщество</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Ко-маркетинг</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Маркет</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Перспективы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Ключевые достижения</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Участники</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Платформа</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Структура платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Свойства платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Применение платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Безопасность платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Безопасность облаков</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/" >Прикладная система</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group"  href="/">Разработчикам</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Техническое описание и стандарты платформы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Техническое описание прикладной системы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Документация для разработчиков</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Шаблоны и примеры</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Тестовая среда</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Маркет</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">AVL</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">SW компоненты</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">HW компоненты</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">SW решения</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Коробочные решения</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Услуги</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Исследования</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Правила работы</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Правила размещения товаров/услуг</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Новости</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Новости отрасли</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Новости проекта</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Новости участников</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Объявления</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a href="/" class="group">Аналитика</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Аналитика рыночная</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Аналитика технологическая</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li><a class="group" href="/">Блог</a>\t\t\t\t\r\n \t\t\t\t<ul>\t\t\t\r\n \t\t\t\t\t<li><a href="/">Редакционные статьи</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Персональные блоги</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Блоги ключевых партнеров</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">Блоги приглашенных спикеров</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</li>\t\t\t\t\r\n \t\t\t<li class="active"><a href="[{omniforum}]">Форум</a></li>\t\t\t\t\r\n \t\t\t<li><a href="/">Контакты</a></li>\t\t\t\t\r\n \t\t</ul>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end header -->\t\t\t\t\t\t\t\r\n<!-- content -->\t\t\t\t\t\t\t\r\n<div class="content">\t\t\t\t\t\t\t\r\n \t<!-- main -->\t\t\t\t\t\t\r\n \t<div class="main">\t\t\t\t\t\t\r\n \t\t<!-- left -->\t\t\t\t\t\r\n \t\t<div class="left">\t\t\t\t\t\r\n \t\t\t<div class="info-block">\t\t\t\t\r\n \t\t\t\t<h2 class="news-analitics">Новости рынка</h2>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Последняя новость рынка</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Запись новости о том, что есть запись рынка, о том, что прямо здесь</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Самая-самая важная запись аналитического мышления</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Самая-самая важная новость нашей рынка</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Самая-самая важная новость нашей рынки</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<a href="/" class="all">Все новости</a>\t\t\t\r\n \t\t\t</div> \t\t\t\t\r\n \t\t\t<div class="info-block">\t\t\t\t\r\n \t\t\t\t<h2 class="technical">Технические новости</h2>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Последняя новость аналитики</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Запись новости о том, что есть запись аналитики, о том, что прямо здесь</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Самая-самая важная запись аналитического мышления</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Самая-самая важная новость нашей аналитики</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Самая-самая важная новость нашей аналитики </a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<a href="/" class="all">Весь блог</a>\t\t\t\r\n \t\t\t</div>\t\t\t\t\r\n \t\t\t<div class="info-block">\t\t\t\t\r\n \t\t\t\t<h2 class="new-market">Новое на маркете</h2>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Последняя новость аналитики</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Запись новости о том, что есть запись аналитики, о том, что прямо здесь</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Самая-самая важная запись аналитического мышления</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Самая-самая важная новость нашей аналитики</a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div>\t\t\t\r\n \t\t\t\t\t<div class="date">12.08.2012</div>\t\t\r\n \t\t\t\t\t<a href="/">Самая-самая важная новость нашей аналитики </a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<a href="/" class="all">Весь блог</a>\t\t\t\r\n \t\t\t</div>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t\t<!-- end left -->\t\t\t\t\t\r\n \t\t<!-- forum -->\t\t\t\t\t\r\n \t\t<div class="forum">\t\t\t\t\t\r\n[>content<]\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n[>comments<]\t\t\t\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t\t<!-- forum -->\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<!-- end-main -->\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end content -->\t\t\t\t\t\t\t\r\n \t<!-- footer -->\t\t\t\t\t\t\r\n \t<div class="footer">\t\t\t\t\t\t\r\n \t\t<a href="#" id="go-top"></a>\t\t\t\t\t\r\n \t\t<div class="footer-left">\t\t\t\t\t\r\n \t\t\tAscatel Inc., Holding Company <span>901 North Pitt Street, Suite 325, <br> Alexandria, VA 22314, USA</span>\t\t\t\t\r\n \t\t\tВсе права защищены\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t\t<div class="footer-center">\t\t\t\t\t\r\n \t\t\t<img src="/images/footer-logo.png" alt="Проект Asymbix" title="Проект Asymbix" />\t\t\t\t\r\n \t\t\t<span>ЗДЕСЬ УКАЗЫВАЕТСЯ НАЗВАНИЕ СЛУЖБЫ И ЕЕ ТЕЛЕФОН</span>\t\t\t\t\r\n \t\t\t<span>E-mail: <a href="mailto:info@ascatel.com">info@ascatel.com</a></span><span>Tel.: 1.202.835.0966</span>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t\t<div class="footer-right">\t\t\t\t\t\r\n \t\t\t<a href="" class="footer-questions">Хотите задать вопрос?</a>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<!-- end footer -->\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end page -->\t\t\t\t\t\t\t\r\n \t<div class="footer-sitemap">\t\t\t\t\t\t\r\n \t\t<div>\t\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">О проекте</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Принципы проекта</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Платформа</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Сообщество</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Ко-маркетинг</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Маркет</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Перспективы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Ключевые достижения</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Участники</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Платформа</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Структура платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Свойства платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Применения платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Безопасность платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Безопасность облаков</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Прикладная система</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Разработчикам</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Техническое описание и стандарты платформы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Техническое описание прикладной системы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Документация для разработчиков</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Шаблоны и примеры</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Тестовая среда</a></li>   \t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Маркет</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">AVL</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">SW компоненты</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">HW компоненты</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">SW решения</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Коробочные решения</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Услуги</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Исследования</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Правила работы</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Правила размещения товаров / услуг</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Новости</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Новости отрасли</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Новости проекта</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Новости участников</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Объявления</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Аналитика</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Аналитика рыночная</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Аналитика технологическая</a></li> \t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Блог</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Редакционные статьи</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Персональные блоги</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Блоги ключевых партнеров</a></li>\t\t\t\r\n \t\t\t\t<li><a href="/">Блоги приглашенных спикеров</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Форум</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t\t<ul>\t\t\t\t\r\n \t\t\t\t<li><a href="/">Контакты</a></li>\t\t\t\r\n \t\t\t</ul>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n<!-- IE -->\t\t\t\t\t\t\t\r\n<div class="ie">\t\t\t\t\t\t\t\r\nВаш браузер морально и физически изношен. Для просмотра сайта установите новую версию браузера.\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end IE -->\t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>', 'portal20130911', 'page'),
(13, '<div class="message-f" id="[>id<]">\t\t\t\t\t\t\t\r\n \t\t\t\t<h2>[>curtopic<]</h2>\t\t\t\r\n \t\t\t\t<div class="left-m">\t\t\t\r\n \t\t\t\t\t<div class="date-l">\t\t\r\n \t\t\t\t\t\t<span>[>mesdate<]</span>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="avatar-l">\t\t\r\n \t\t\t\t\t\t<img src="[>upic<]" />\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="member-l">\t\t\r\n \t\t\t\t\t\tУчастник\t\r\n \t\t\t\t\t\t<a href="/">[>firstname<] [>surname<]</a>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="company-l">\t\t\r\n \t\t\t\t\t\tКомпания\t\r\n \t\t\t\t\t\t<a href="/">[>company<]</a>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="text-l">Сообщений [>mesqty<] <br>Зарегистрирован: [>regdate<]</div>\t\t\r\n \t\t\t\t\t<a href="/" class="send-message"></a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div class="main-m">\t\t\t\r\n \t\t\t\t\t<h3>&nbsp;[>headmes<]<a href="[{editmes}]/comment/[>id<]" class="edit-m"></a><a class="blockquote" id="b[>id<]"></a></h3>\t\t\r\n \t\t\t\t\t<div id="cb[>id<]">[>commentext<]</div>\t\t\r\n \t\t\t\t\t<div class="main-tools-m">\t\t\r\n \t\t\t\t\t\t<a class="button replylink">Ответить.</a>\t\r\n \t\t\t\t\t\t<div class="rating-mt">\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t</div>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n</div>', 'portal', 'comment'),
(14, '<tr>\t\t\t\t\t\t\t\r\n \t\t\t\t\t<td>\t\t\r\n \t\t\t\t\t\t<h2><a href="[{omniforum}]/[>shortname_url<]/[>shortsub_url<]">[>subname<]</a></h2>\t\r\n \t\t\t\t\t\t<p>[>description<]</p>\t\r\n \t\t\t\t\t</td>\t\t\r\n \t\t\t\t\t<td>[>topics_qty<]</td>\t\t\r\n \t\t\t\t\t<td>[>com_qty<]</td>\t\t\r\n \t\t\t\t\t<td>\t\t\r\n \t\t\t\t\t\t<p><a href="[{omniforum}]/[>shortname_url<]/[>shortsub_url<]/[>topic_id<]">[>topic<]</a></p>\t\r\n \t\t\t\t\t\t<div>\t\r\n \t\t\t\t\t\t\t<span>[>datetime<]</span>\r\n \t\t\t\t\t\t\t<span>[>surname<] [>firstname<]</span>\r\n \t\t\t\t\t\t</div>\t\r\n \t\t\t\t\t</td>\t\t\r\n</tr>', 'portal', 'subcatable'),
(15, '<tr>\t\t\t\t\t\t\t\r\n \t\t\t\t\t<td>\t\t\r\n \t\t\t\t\t\t<h2><a href="[{omniforum}]/[>topic_url<]">[>topic<]</a></h2>\t\r\n \t\t\t\t\t\t<p>[>headmes<]</p>\t\r\n \t\t\t\t\t</td>\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t<td width=''15%''>[>com_qty<]</td>\t\t\r\n \t\t\t\t\t<td width=''20%''>\t\t\r\n \t\t\t\t\t\t<p>[>comment<]</p>\t\r\n \t\t\t\t\t\t<div>\t\r\n \t\t\t\t\t\t\t<span>[>datetime<]</span>\r\n \t\t\t\t\t\t\t<span>[>surname<] [>firstname<]</span>\r\n \t\t\t\t\t\t</div>\t\r\n \t\t\t\t\t</td>\t\t\r\n</tr>', 'portal', 'topicatable'),
(16, '<div class="message-f" id="[>id<]">\t\t\t\t\t\t\t\r\n \t\t\t\t<h2>[>curtopic<]<a href="/" class="add-message"></a></h2>\t\t\t\r\n \t\t\t\t<div class="left-m">\t\t\t\r\n \t\t\t\t\t<div class="date-l">\t\t\r\n \t\t\t\t\t\t<span>[>mesdate<]</span>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="avatar-l">\t\t\r\n \t\t\t\t\t\t<img src="[>upic<]" />\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="member-l">\t\t\r\n \t\t\t\t\t\tУчастник\t\r\n \t\t\t\t\t\t<a href="/">[>firstname<] [>surname<]</a>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="company-l">\t\t\r\n \t\t\t\t\t\tКомпания\t\r\n \t\t\t\t\t\t<a href="/">[>company<]</a>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="text-l">Сообщений [>mesqty<] <br>Зарегистрирован: [>regdate<]</div>\t\t\r\n \t\t\t\t\t<a href="/" class="send-message"></a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div class="main-m">\t\t\t\r\n \t\t\t\t\t<h3>&nbsp;[>headmes<]<a href="/" class="edit-m"></a><a href="/" class="blockquote"></a></h3>\t\t\r\n \t\t\t\t\t[>commentext<]\t\t\r\n \t\t\t\t\t<div class="main-tools-m">\t\t\r\n \t\t\t\t\t\t<a href="#[>id<]" class="button replylink">Ответить</a>\t\r\n \t\t\t\t\t\t<div class="rating-mt">\t\r\n \t\t\t\t\t\t\t<a href="#">+</a>\r\n \t\t\t\t\t\t\t[>mesrate<]\r\n \t\t\t\t\t\t\t<a href="#">–</a>\r\n \t\t\t\t\t\t</div>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n</div>', 'portal_res', 'comment'),
(17, '<div class="message-f" >\t\t\t\t\t\t\t\r\n \t\t\t\t<h2>[>curtopic<]</h2>\t\t\t\r\n \t\t\t\t<div class="left-m">\t\t\t\r\n \t\t\t\t\t<div class="date-l">\t\t\r\n \t\t\t\t\t\t<span>[>mesdate<]</span>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="avatar-l">\t\t\r\n \t\t\t\t\t\t<img src="[>upic<]" />\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="member-l">\t\t\r\n \t\t\t\t\t\tУчастник\t\r\n \t\t\t\t\t\t<a href="/">[>firstname<] [>surname<]</a>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="company-l">\t\t\r\n \t\t\t\t\t\tКомпания\t\r\n \t\t\t\t\t\t<a href="/">[>company<]</a>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t\t<div class="text-l">Сообщений [>mesqty<] <br>Зарегистрирован: [>regdate<]</div>\t\t\r\n \t\t\t\t\t<a href="/" class="send-message"></a>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n \t\t\t\t<div class="main-m">\t\t\t\r\n \t\t\t\t\t<h3>&nbsp;[>headmes<]<a href="[{editmes}]/message/[>id<]" class="edit-m"></a><a class="blockquote" id="b[>id<]"></a></h3>\t\t\r\n \t\t\t\t\t<div id="cb[>id<]">[>commentext<]</div>\t\t\r\n \t\t\t\t\t<div class="main-tools-m">\t\t\r\n \t\t\t\t\t\t<a href="#[>id<]" class="button replylink">Ответить</a>\t\r\n \t\t\t\t\t\t<div class="rating-mt">\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t</div>\t\r\n \t\t\t\t\t</div>\t\t\r\n \t\t\t\t</div>\t\t\t\r\n</div>', 'portal', 'topic'),
(18, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\t\t\t\t\t\t\t\r\n<html xmlns="http://www.w3.org/1999/xhtml"><head>\t\t\t\t\t\t\t\r\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\t\t\t\t\t\t\t\r\n<title>[>title<]</title>\t\t\t\t\t\t\t\r\n<meta name="description" content="[>description<]" />\t\t\t\t\t\t\t\r\n<meta name="Keywords" content="[>keywords<]" />\t\t\t\t\t\t\t\r\n[>noindex<]\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/eng_portal.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootstrap.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/style_forum.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/cabinet.css" type="text/css" media="screen" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/bootsnew.css" />\t\t\t\t\t\t\t\r\n<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css"/>\t\t\t\t\t\t\t\r\n<link rel="icon" href="/favicon.ico" type="image/x-icon">\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/jquery-1.7.2.js"></script>\t\t\t\t\t\t\t\r\n<script type="text/javascript" src="/flexcroll.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery-ui-1.8.20.custom.min.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/jquery.ui.datepicker-ru.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/corner.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easytooltip.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.easing.1.3.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/jquery.timers.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/boot/bootstrap-alert.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/partial.js"></script>\t\t\t\t\t\t\t\r\n<script src="/ckeditor/ckeditor.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script src="/js/go_ales.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/go_form_direct.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/lightbox.js"></script>\t\t\t\t\t\t\t\r\n<script src="/js/refresh_cap.js"></script>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<script type="text/javascript">\t\t\t\t\t\t\t\r\nfunction clickdisplay(objName, a) {\t\t\t\t\t\t\t\r\nvar object = document.getElementById(objName);\t\t\t\t\t\t\t\r\nobject.style.display = (object.style.display == ''none'') ? '''' : ''none''\t\t\t\t\t\t\t\r\n}\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- кнопка вверх -->\t\t\t\t\t\t\t\r\n<script>\t\t\t\t\t\t\t\r\n$(function(){\t\t\t\t\t\t\t\r\n  $.fn.scrollToTop=function(){\t\t\t\t\t\t\t\r\n    $(this).hide().removeAttr("href");\t\t\t\t\t\t\t\r\n    if($(window).scrollTop()!="0"){\t\t\t\t\t\t\t\r\n        $(this).fadeIn("slow")\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n  var scrollDiv=$(this);\t\t\t\t\t\t\t\r\n  $(window).scroll(function(){\t\t\t\t\t\t\t\r\n    if($(window).scrollTop()=="0"){\t\t\t\t\t\t\t\r\n    $(scrollDiv).fadeOut("slow")\t\t\t\t\t\t\t\r\n    }else{\t\t\t\t\t\t\t\r\n    $(scrollDiv).fadeIn("slow")\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n  });\t\t\t\t\t\t\t\r\n    $(this).click(function(){\t\t\t\t\t\t\t\r\n      $("html, body").animate({scrollTop:0},"slow")\t\t\t\t\t\t\t\r\n    })\t\t\t\t\t\t\t\r\n  }\t\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n$(function() {$("#go-top").scrollToTop();});\t\t\t\t\t\t\t\r\n$(function() {\t\t\t\t\t\t\t\r\n    $(window).resize(function() {\t\t\t\t\t\t\t\r\n        var width = $(window).outerWidth();\t\t\t\t\t\t\t\r\n        if (width < 1380) {\t\t\t\t\t\t\t\r\n            $("#go-top").addClass("go-top");\t\t\t\t\t\t\t\r\n        } else {\t\t\t\t\t\t\t\r\n            $("#go-top").removeClass("go-top");\t\t\t\t\t\t\t\r\n        }\t\t\t\t\t\t\t\r\n    });\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t$(window).resize();\t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- end кнопка вверх -->\t\t\t\t\t\t\t\r\n<!-- плавное раскрытие и скрытие -->\t\t\t\t\t\t\t\r\n<script language="javascript">\t\t\t\t\t\t\t\r\n$(document).ready(function(){\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t$(".slide-extremum").hover(function(){\t\t\t\t\t\t\r\n \t\t$(".slide-extremum>.extremum").slideToggle("slow");\t\t\t\t\t\r\n \t\t$(this).toggleClass("active"); return false;\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t \t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- end плавное раскрытие и скрытие -->\t\t\t\t\t\t\t\r\n<!-- плавное раскрытие и скрытие блок документов для скачивания -->\t\t\t\t\t\t\t\r\n<script language="javascript">\t\t\t\t\t\t\t\r\n$(document).ready(function(){\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t$(".slide-extremum-click h2").click(function(){\t\t\t\t\t\t\r\n \t\t$(".slide-extremum-click>.extremum-click").slideToggle("slow");\t\t\t\t\t\r\n \t\t$(this).toggleClass("active"); return false;\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t$(".slide-extremum-click1 h2").click(function(){\t\t\t\t\t\t\r\n \t\t$(".slide-extremum-click1>.extremum-click").slideToggle("slow");\t\t\t\t\t\r\n \t\t$(this).toggleClass("active"); return false;\t\t\t\t\t\r\n \t});\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n \t \t\t\t\t\t\t\r\n});\t\t\t\t\t\t\t\r\n</script>\t\t\t\t\t\t\t\r\n<!-- end плавное раскрытие и скрытие \t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n<span><img src="/images/default-avatar.png" width="14" height="18" alt="Это Вы" title="Это Вы" style="align:left;"/>[>loginout<]</span>\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n-->\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n</head>\t\t\t\t\t\t\t\r\n<body>\t\t\t\t\t\t\t\r\n<!-- page -->\t\t\t\t\t\t\t\r\n<div class="top-panel">\t\t\t\t\t\t\t\r\n \t<div class="top-content internal">\t\t\t\t\t\t\r\n \t\t<a href="/" class="logo-medium" id="logo-medium">Assymbix</a>\t\t\t\t\t\r\n \t\t<div class="settings-profile">\t\t\t\t\t\r\n \t\t\t<span><img src="/images/default-avatar.png" width="14" height="18" alt="Это Вы" title="Это Вы" style="align:left;"/><!--[>loginout<]-->\t</span>\t\t\t\t\r\n \t\t\t<div class="slide-extremum">\t\t\t\t\r\n \t\t\t\t<a href="/" class="language"></a>\t\t\t\r\n \t\t\t\t<ul class="extremum">\t\t\t\r\n \t\t\t\t\t<li><a href="#" class="active">Русский</a></li>\t\t\r\n \t\t\t\t\t<li><a href="/">English</a></li>\t\t\r\n \t\t\t\t</ul>\t\t\t\r\n \t\t\t</div>\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<div class="page internal">\t\t\t\t\t\t\t\r\n<!-- header -->\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\r\n<!-- end header -->\t\t\t\t\t\t\t\r\n<!-- content -->\t\t\t\t\t\t\t\r\n<div class="content">\t\t\t\t\t\t\t\r\n \t<!-- main -->\t\t\t\t\t\t\r\n \t<div class="main">\t\t\t\t\t\t\r\n \t\t<!-- left -->\t\t\t\t\t\r\n\t\t\t\t\t\r\n \t\t<!-- end left -->\t\t\t\t\t\r\n \t\t<!-- forum -->\t\t\t\t\t\r\n \t\t<div class="forum">\t\t\t\t\t\r\n[>content<]\t\t\t\t\t\t\t\r\n \t\t\t\t\t\t\t\r\n[>comments<]\t\t\t\t\t\t\t\r\n \t\t</div>\t\t\t\t\t\r\n \t\t<!-- forum -->\t\t\t\t\t\r\n \t</div>\t\t\t\t\t\t\r\n \t<!-- end-main -->\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end content -->\t\t\t\t\t\t\t\r\n \t<!-- footer -->\t\t\t\t\t\t\r\n \t\t\t\t\r\n \t<!-- end footer -->\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end page -->\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\r\n<!-- IE -->\t\t\t\t\t\t\t\r\n<div class="ie">\t\t\t\t\t\t\t\r\nВаш браузер морально и физически изношен. Для просмотра сайта установите новую версию браузера.\t\t\t\t\t\t\t\r\n</div>\t\t\t\t\t\t\t\r\n<!-- end IE -->\t\t\t\t\t\t\t\r\n</body>\t\t\t\t\t\t\t\r\n</html>', 'portal20130930', 'page');

-- 
-- Вывод данных для таблицы sys_userpics
--
INSERT INTO sys_userpics VALUES
(1, NULL, 'default', '/imag/upics/default.jpg'),
(2, 7, 'crazy cat', '/imag/upics/upicat.jpg'),
(3, 7, 'tiger', '/imag/upics/tiger.jpg');

-- 
-- Вывод данных для таблицы sys_users
--
INSERT INTO sys_users VALUES
(1, '001589575724236045', '001589575724236045', 2, 1, 'Плюшкин', 'Антон', 'Петрович', NULL, '', '', NULL, 'pp@pp.ru', '79031234567', '1975-03-01', 80000, '2012-03-14 18:21:57', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '1234567900', '1234567900', 1, 1, 'Мамонтов', 'Сергей', 'Исаакович', NULL, '', '', NULL, 'slow@totem.ru', '79023215235', '1978-02-12', 0, '2012-03-14 18:21:57', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '3010024387', '3010024387', 1, 1, 'Дроздецкий', 'Денис', 'Георгиевич', 'Омникомм', 'Denissimo', 'repakuku', NULL, 'fast@totem.ru', '79033215235', '1975-02-12', 12000000, '2013-09-16 18:39:49', NULL, NULL, NULL, NULL, NULL, NULL),
(4, '9001230000', '9001230000', 1, 1, 'Иванов', 'Пётр', 'Иванович', NULL, 'login01', '123111', NULL, 'slow@totem.ru', '100000000', '1978-02-12', 0, '2013-06-18 20:21:12', NULL, NULL, NULL, NULL, NULL, NULL),
(5, '9001230001', '9001230001', 1, 1, 'Петров', 'Пётр', 'Иванович', NULL, 'login2', '123111', NULL, 'slow@totem.ru', '100000000', '1978-02-12', 0, '2012-03-26 18:54:06', NULL, NULL, NULL, NULL, NULL, NULL),
(6, '9001230002', '9001230002', 1, 1, 'Сидоров', 'Пётр', 'Иванович', NULL, 'login3', '123111', NULL, 'slow@totem.ru', '100000000', '1978-02-12', 0, '2012-03-26 19:00:11', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '9001230003', '9001230003', 1, 1, 'Кузнецов', 'Пётр', 'Иванович', 'ФСБ РФ', 'login4', '123111', 'Den', 'slow@totem.ru', '100000000', '1978-02-12', 0, '2013-09-12 18:59:34', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '9001230004', '9001230004', 1, 1, 'Никитин', 'Пётр', 'Иванович', NULL, 'login5', '123110', NULL, 'slow@totem.ru', '100000000', '1978-02-12', 0, '2013-06-05 14:39:09', NULL, NULL, NULL, NULL, NULL, NULL),
(9, '9001230005', '9001230005', 1, 1, 'Алёшин', 'Пётр', 'Иванович', NULL, 'login6', '123112', NULL, 'slowpok@totem.ru', '100000000', '1978-02-12', 0, '2013-06-06 16:56:19', NULL, NULL, NULL, NULL, NULL, NULL),
(10, '9001230006', '9001230006', 1, 1, 'Овсов', 'Пётр', 'Иванович', NULL, 'login7', '123111', NULL, 'slowpok@totem.ru', '100000000', '1978-02-12', 0, '2013-02-27 16:22:47', NULL, NULL, NULL, NULL, NULL, NULL),
(13, '123111325', '8674jgccjjch', 1, NULL, 'Конкин', 'Иван', 'Петрович', NULL, 'login8', '123111', NULL, 'trj@rosvet.ru', '+7916-333-2211', '1974-10-16', NULL, '2013-04-17 21:02:21', NULL, NULL, NULL, NULL, NULL, NULL),
(15, '9001230008', '9001230008', 2, 4, '', '', '', NULL, '', '', NULL, '', '', '0000-00-00 00:00:00', 0, '2012-05-03 20:08:48', NULL, NULL, NULL, NULL, NULL, NULL),
(16, '9001230009', '9001230009', 2, 4, '', '', '', NULL, '', '', NULL, '', '', '0000-00-00 00:00:00', 0, '2012-05-03 20:08:48', NULL, NULL, NULL, NULL, NULL, NULL),
(17, '9001230010', '9001230010', 2, 4, '', '', '', NULL, '', '', NULL, '', '', '0000-00-00 00:00:00', 0, '2012-05-03 20:08:48', NULL, NULL, NULL, NULL, NULL, NULL),
(18, '9001230011', '9001230011', 2, 4, '', '', '', NULL, '', '', NULL, '', '', '0000-00-00 00:00:00', 0, '2012-05-03 20:08:48', NULL, NULL, NULL, NULL, NULL, NULL),
(49, '54491470', '54491470', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-04 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL),
(50, '54491471', '54491471', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-04 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL),
(52, '54491473', '54491473', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-04 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL),
(53, '54491474', '54491474', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-04 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL),
(54, '54491475', '54491475', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-04 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL),
(55, '54491476', '54491476', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-04 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL),
(56, '54491477', '54491477', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-04 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL),
(57, '54491478', '54491478', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-04 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL),
(58, '54491479', '54491479', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-04 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL),
(59, '054881005906', '054881005906', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-05 16:13:19', NULL, NULL, NULL, NULL, NULL, NULL),
(60, '054881005907', '054881005907', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-05 16:13:19', NULL, NULL, NULL, NULL, NULL, NULL),
(61, '054881005908', '054881005908', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-05 16:13:19', NULL, NULL, NULL, NULL, NULL, NULL),
(62, '054881005909', '054881005909', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-05 16:13:19', NULL, NULL, NULL, NULL, NULL, NULL),
(63, '4607046120141', '4607046120141', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-05 16:14:32', NULL, NULL, NULL, NULL, NULL, NULL),
(189, '901230321', 'lk0jhgvohlc', 1, 0, 'Овсоу', 'Пётр', 'Сергеевич', NULL, 'login9', '123111', NULL, 'slo@totem.ru', '+79057107350', '1977-02-06', 0, '2013-05-17 17:04:47', NULL, NULL, NULL, NULL, NULL, NULL);

-- 
-- Вывод данных для таблицы typeactions
--

-- Таблица promo.typeactions не содержит данных

-- 
-- Вывод данных для таблицы typechecks
--
INSERT INTO typechecks VALUES
(1, 'filled', ''),
(2, 'equal', ''),
(3, 'differ', ''),
(4, 'exist', ''),
(5, 'empty', ''),
(6, 'longer', ''),
(7, 'shorter', ''),
(8, 'email', ''),
(9, 'numlat', ''),
(10, 'login', ''),
(11, 'logout', ''),
(12, 'dataput', ''),
(13, 'keeptags', ''),
(14, 'md5', ''),
(15, 'regexp', NULL),
(16, 'quotes', NULL),
(17, 'html', NULL),
(18, 'update', '');

-- 
-- Вывод данных для таблицы typecolors
--
INSERT INTO typecolors VALUES
(1, 'Красный'),
(2, 'Оранжевый'),
(3, 'Жёлтый'),
(4, 'Зелёный'),
(5, 'Голубой'),
(6, 'Синий'),
(7, 'Фиолетовый');

-- 
-- Вывод данных для таблицы typedevices
--
INSERT INTO typedevices VALUES
(1, 'териминал'),
(2, 'турникет'),
(3, 'касса');

-- 
-- Вывод данных для таблицы typelodges
--
INSERT INTO typelodges VALUES
(1, 'тип 1', 0),
(2, 'тип 2', 0),
(3, 'тип 3', 0),
(4, 'Пехота', 1);

-- 
-- Вывод данных для таблицы typepayms
--

-- Таблица promo.typepayms не содержит данных

-- 
-- Вывод данных для таблицы typeusers
--
INSERT INTO typeusers VALUES
(1, 'метка'),
(2, 'карта');

-- 
-- Вывод данных для таблицы typevents
--
INSERT INTO typevents VALUES
(1, 'банкет'),
(2, 'фуршет'),
(3, 'фуршет с рассадкой'),
(4, 'банкет с фуршетной линией'),
(5, 'кофебрейк');

-- 
-- Вывод данных для таблицы users
--

-- Таблица promo.users не содержит данных

-- 
-- Вывод данных для таблицы wiki
--
INSERT INTO wiki VALUES
(1, 'Пробная тема', '<a href="[{wiki/Вторая запись}]">222</a><br />\t\t\t\t\t\t\t\r\n[{wiki}]<br />\t\t\t\t\t\t\t\r\n<a href="[{test3}]">Проба 3</a><br />\t\t\t\t\t\t\t\r\n[{wiki}]<br />', 'Заголовок: Пробная тема (Вики)', 'keys : Пробная тема (Вики)', 'descr: Пробная тема (Вики)', '2013-09-02 20:26:41'),
(2, 'Вторая запись', 'Вторая запись:\t\t\t\t\t\t\t\r\n<b>Второй заголовок</b><br />\t\t\t\t\t\t\t\r\nссылка на пункт [{test}]<br />\t\t\t\t\t\t\t\r\nкусок контента [>button04<]<br />\t\t\t\t\t\t\t\r\n<br />\t\t\t\t\t\t\t\r\n<a href="[{test89}]">Проба 89</a><br />\t\t\t\t\t\t\t\r\n[{test89}]<br />\t\t\t\t\t\t\t\r\n<a href="[{test3}]">Проба 3</a><br />\t\t\t\t\t\t\t\r\n[{test3}]<br />\t\t\t\t\t\t\t\r\nссылка на пункт <a href=" [{wiki/Пробная тема}]">GПробн.</a><br />\t\t\t\t\t\t\t\r\nссылка на test3 <a href=" [{test2/1234sdfg}]">TEST 3</a><br />\t\t\t\t\t\t\t\r\n[{test2}]', '', '', '', '2013-09-02 20:34:13');

-- 
-- Вывод данных для таблицы ztest
--
INSERT INTO ztest VALUES
(49, 231435, 1, 'qwerty', 'qwerty', 0, '2012-03-28 14:27:58'),
(50, 123, 1, '01', '02', 3, '2012-03-28 14:28:40'),
(51, 1345134, NULL, '123', '123', 789, '2012-03-28 16:00:22'),
(52, 145, NULL, '123', '123', 789, '2012-03-28 16:01:23'),
(53, 4278, NULL, '1234', '1234', 789, '2012-03-28 16:01:59'),
(54, 13241, NULL, NULL, NULL, NULL, '2012-03-29 16:07:24'),
(55, 2465, NULL, NULL, NULL, NULL, '2012-03-29 16:07:38'),
(56, 3457, NULL, NULL, NULL, NULL, '2012-03-29 16:09:29'),
(57, 43684, NULL, NULL, NULL, NULL, '2012-03-29 16:10:28'),
(59, 13, 0, '', '', 0, '0000-00-00 00:00:00'),
(60, 13, 0, '', '', 0, '0000-00-00 00:00:00'),
(61, 0, 0, '13', '', 0, '0000-00-00 00:00:00'),
(62, 13, 0, '', '', 0, '0000-00-00 00:00:00'),
(63, 13, 0, '', '', 0, '0000-00-00 00:00:00'),
(64, 0, 0, '13', '', 0, '0000-00-00 00:00:00');

-- 
-- Вывод данных для таблицы zz_bukets
--
INSERT INTO zz_bukets VALUES
(93, '11-102', '12-305x49:99-001x1', 'df185.jpg', 'f185.jpg', 'buk', 'Сердце из роз', 'Heart from roses', NULL, NULL, 0, 0),
(94, '11-106', '12-305x7:14-306x1:14-271x1:14-334x2:14-304x4:14-365x1:14-327x15:14-303x2:99-003x2:99-001x1:99-003x12', 'df196.jpg', 'f196.jpg', 'buk', 'Букет «Клубничка»', 'Bouquet «Strawberry»', NULL, NULL, 0, 1),
(95, '11-104', '12-305x25:99-003x12:99-001x1', 'df199.jpg', 'f199.jpg', 'buk', 'Сердце из цветов', 'Heart from flowers', NULL, NULL, 0, 1),
(133, '12-200', '14-304x10:99-003x40:99-001x1', 'df125.jpg', 'f125.jpg', 'toy', 'Фигурка «Тигр»', 'Composition «Tiger»', NULL, NULL, 1, 0);

-- 
-- Вывод данных для таблицы zz_categ
--
INSERT INTO zz_categ VALUES
(1, 'toy', 1, 1, 'Игрушки из цветов', 'Flower toys', 'Фигурки из цветов, игрушки из живых цветов.', 'цветы, фигурки из цветов, игрушки', 'Оригинальные фигурки животных из цветов', '<h1>Игрушки ИЗ ЖИВЫХ ЦВЕТОВ (фигурки животных)</h1>'),
(2, 'buk', 2, 1, 'Букеты', 'Bouquets', 'Доставка цветов. Букеты из роз.', 'цветы, доставка цветов, букеты из роз', 'Заказ и доставка по Москве букетов из роз.', 'Букет из роз - лучший подарок любимой девушке.'),
(3, 'wed', 3, 1, 'Свадебные букеты', 'Wedding bouquets', 'Свадебные букеты с доставкой по Москве. Букеты невесты, евробукеты.', 'свадебные букеты, Москва, букет невесты, евробукет', 'Доставка по Москве свадебных букетов, евробукетов (букетов невесты)', '<h1>Свадебные букеты, Букеты невесты, Евробукеты.</h1>'),
(4, 'bas', 4, 1, 'Корзины из цветов', 'Baskets', 'Корзины из цветов с доставкой по Москве.', 'корзины, цветы, корзины из цветов, доставка по Москве', 'Доставка по Москве цветочных корзин.', '<h1>Корзины с живыми цветами - роскошный подарок.</h1>'),
(5, 'flo', 5, 1, 'Цветы', 'Flowers', 'Доставка цветов по Москве. Розы, герберы, орхидеи.', 'цветы, доставка цветов, розы, герберы, орхидеи', 'Заказ и доставка по Москве роз, гербер, хризантем и других цветов.', '<h1>Розы и другие цветы.</h1>');

-- 
-- Вывод данных для таблицы zz_domains
--
INSERT INTO zz_domains VALUES
(29052, 'aviatika.com', 'bonus-iv.ru', 'aviatika.com/links.html', 90, NULL, 0),
(29058, 'bonus-iv.ru', 'gabion-dv.ru', 'www.bonus-iv.ru/links.php?id=278153976', 30, NULL, 0),
(29056, 'calore-it.ru', 'gabion-dv.ru', 'calore-it.ru/link', 20, NULL, 0),
(29061, 'gabion-dv.ru', 'granit.arvixe.ru', 'gabion-dv.ru/ssl.php', 30, NULL, 0),
(29050, 'granit.arvixe.ru', 'homeidea.ru', 'granit.arvixe.ru/links/index.php', 20, NULL, 0),
(29053, 'homeidea.ru', NULL, 'homeidea.ru/links.php', 200, NULL, 0),
(29049, 'iiz.ru', NULL, 'www.iiz.ru/links', 70, NULL, 0),
(29064, 'ivanovogobelen.ru', NULL, 'www.ivanovogobelen.ru/links.php?id=427265114', 20, NULL, 0),
(29054, 'life-kofe.ru', NULL, 'life-kofe.ru/pages/repair', 30, NULL, 0),
(29063, 'moneylaw.ru', NULL, 'moneylaw.ru/links/links.php', 20, NULL, 0),
(29057, 'muviz.ru', NULL, 'muviz.ru/forum/links.php', 40, NULL, 0),
(29051, 'obol.by', 'muviz.ru', 'obol.by/list.html', 30, NULL, 0),
(29062, 'pervoevtoroe.ru', 'obol.by', 'pervoevtoroe.ru/links.php?id=318469635', 40, NULL, 0),
(29068, 'rollgrad.ru', 'pervoevtoroe.ru', 'www.rollgrad.ru/catalog/poleznie_ssilki', 50, NULL, 0),
(29066, 'russia-smolensk.ru', 'rollgrad.ru', 'www.russia-smolensk.ru/links/links.php?id=307', 60, NULL, 0),
(29060, 'soft-city.ru', 'russia-smolensk.ru', 'soft-city.ru/links.php?id=491297226', 40, NULL, 0),
(29067, 'spart-aeros.com.ua', 'rollgrad.ru', 'www.spart-aeros.com.ua/links.php', 40, NULL, 0),
(29055, 'vkamushek.ru', NULL, 'vkamushek.ru/links.html', 20, NULL, 0),
(29065, 'wodoley.net', NULL, 'wodoley.net/faq', 50, NULL, 0),
(29059, 'znakomstva.zaposti.net', NULL, 'znakomstva.zaposti.net/li.html', 20, NULL, 0);

-- 
-- Вывод данных для таблицы zz_sites
--

-- Таблица promo.zz_sites не содержит данных

-- 
-- Вывод данных для таблицы zzcomment
--
INSERT INTO zzcomment VALUES
(1, 3, 1, 1),
(2, 5, 2, 1),
(3, 7, 1, 2),
(4, 8, 2, 2),
(5, 2, 3, 4),
(6, 4, 8, 3),
(7, 10, 1, 1),
(8, 11, 4, 3),
(9, 12, 2, 2);

-- 
-- Вывод данных для таблицы zzprofiles
--
INSERT INTO zzprofiles VALUES
(1, 2, 'Крокодил'),
(2, 3, 'Апулаз'),
(3, 1, 'Сыр');

-- 
-- Вывод данных для таблицы zztest
--
INSERT INTO zztest VALUES
(24, 445, NULL, NULL, NULL, NULL, NULL),
(31, 13, 0, '', '', 0, NULL),
(32, 13, 0, '', '', 0, 31),
(33, 0, 0, '13', '', 0, 32),
(34, 13, 0, '', '', 0, 31),
(35, 13, 0, '', '', 0, 34),
(36, 0, 0, '13', '', 0, NULL);

-- 
-- Вывод данных для таблицы zztwits
--
INSERT INTO zztwits VALUES
(1, 2, 'фывапфыпфыкпфп'),
(2, 2, 'йуйуейцуеуе'),
(3, 2, 'яячсячяячсияи'),
(4, 3, '            [row_id] => 46\t\t\t\t\t\t\t\r\n            [phpfile] => data_chpuadd.php\t\t\t\t\t\t\t\r\n            [scrip] => \t\t\t\t\t\t\t\r\n            [template] => test\t\t\t\t\t\t\t\r\n            [parent] => \t\t\t\t\t\t\t\r\n            [level] => 1\t\t\t\t\t\t\t\r\n            [address] => engine/add url\t\t\t\t\t\t\t\r\n            [h1] => \t\t\t\t\t\t\t\r\n            [label] => chpuadd\t\t\t\t\t\t\t\r\n            [menu] => \t\t\t\t\t\t\t\r\n            [title] => Добавление раздела\t\t\t\t\t\t\t\r\n            [keywords] => Ключевые слова страницы Добавление раздела\t\t\t\t\t\t\t\r\n            [description] => Описание страницы Добавление раздела\t\t\t\t\t\t\t\r\n            [noindex] => 0\t\t\t\t\t\t\t\r\n            [access] => 2\t\t\t\t\t\t\t\r\n            [virtual] => 0\t\t\t\t\t\t\t\r\n            [header] => '),
(5, 3, '            [row_id] => 49\t\t\t\t\t\t\t\r\n            [phpfile] => data_scriptadd.php\t\t\t\t\t\t\t\r\n            [scrip] =>  \t\t\t\t\t\t\t\r\n            [template] => test\t\t\t\t\t\t\t\r\n            [parent] => \t\t\t\t\t\t\t\r\n            [level] => 1\t\t\t\t\t\t\t\r\n            [address] => scriptadd\t\t\t\t\t\t\t\r\n            [h1] => 123\t\t\t\t\t\t\t\r\n            [label] => scriptadd\t\t\t\t\t\t\t\r\n            [menu] => \t\t\t\t\t\t\t\r\n            [title] => Добавление скрипта\t\t\t\t\t\t\t\r\n            [keywords] => Ключевые слова страницы Движок\t\t\t\t\t\t\t\r\n            [description] => Описание страницы Движок\t\t\t\t\t\t\t\r\n            [noindex] => \t\t\t\t\t\t\t\r\n            [access] => 1\t\t\t\t\t\t\t\r\n            [virtual] => \t\t\t\t\t\t\t\r\n            [header] => Добавление скрипта\t\t\t\t\t\t\t\r\n'),
(6, 3, '            [row_id] => 50\t\t\t\t\t\t\t\r\n            [phpfile] => \t\t\t\t\t\t\t\r\n            [scrip] => addpict\t\t\t\t\t\t\t\r\n            [template] => test\t\t\t\t\t\t\t\r\n            [parent] => \t\t\t\t\t\t\t\r\n            [level] => 1\t\t\t\t\t\t\t\r\n            [address] => addpicture\t\t\t\t\t\t\t\r\n            [h1] => \t\t\t\t\t\t\t\r\n            [label] => addpicture\t\t\t\t\t\t\t\r\n            [menu] => \t\t\t\t\t\t\t\r\n            [title] => Движок\t\t\t\t\t\t\t\r\n            [keywords] => Ключевые слова страницы Движок\t\t\t\t\t\t\t\r\n            [description] => Описание страницы Движок\t\t\t\t\t\t\t\r\n            [noindex] => 0\t\t\t\t\t\t\t\r\n            [access] => 1\t\t\t\t\t\t\t\r\n            [virtual] => 0\t\t\t\t\t\t\t\r\n            [header] => '),
(7, 1, '- Он не придет, - холодно произнес я, - и тебе отсюда не уйти. Он не\t\t\t\t\t\t\t\r\nв силах тебе помочь. Никто здесь тебе не поможет. Здесь властвует высшая\t\t\t\t\t\t\t\r\nмагия, и не оскорбляй ее, профан, своими жалкими попытками противоборства.\t\t\t\t\t\t\t\r\nЗнаешь ли ты, что лежит за стеной смерча? Хаос! И я отдам тебя Хаосу, если\t\t\t\t\t\t\t\r\nты не расскажешь мне все. И о Джулии, и о своем хозяине, и о том, как ты\t\t\t\t\t\t\t\r\nосмелился перенести меня сюда.\t\t\t\t\t\t\t\r\nОн испуганно отшатнулся в сторону от границы Хаоса и повернулся лицом\t\t\t\t\t\t\t\r\nко мне.'),
(8, 1, '- Чертежи, заметки и наброски были разбросаны по твоему столу, на\t\t\t\t\t\t\t\r\nчертежной доске и даже у тебя дома. Пару раз я их видел. Да и трудно было\t\t\t\t\t\t\t\r\nне заметить. Большинство было даже помечено грифом "Колесо-Призрак". И\t\t\t\t\t\t\t\r\nничего подобного в работе "Гранд Дизайн" не появлялось. Вывод был прост -\t\t\t\t\t\t\t\r\nя предположил, что это твое любимое детище, твой билет в счастливое\t\t\t\t\t\t\t\r\nбудущее. Я никогда не считал тебя непрактичным. Такого впечатления ты на\t\t\t\t\t\t\t\r\nменя не производил. Так ты настаиваешь, что это была всего лишь шутка?\t\t\t\t\t\t\t\r\n- Ну... Если мы займемся этим делом и создадим ту часть конструкции,\t\t\t\t\t\t\t\r\nкоторая может быть создана здесь, - честно ответил я, - то получится лишь\t\t\t\t\t\t\t\r\nстранного вида конструкция, которая совершенно ничего не будет делать.\t\t\t\t\t\t\t\r\nОн покачал головой.'),
(9, 1, 'Я тихо подошел к часовым и положил Фракира на плечо стоявшего слева,\t\t\t\t\t\t\t\r\nприказав быстро придушить. Затем три быстрых шага направо, и я ударил\t\t\t\t\t\t\t\r\nдругого часового с левой стороны по шее ребром ладони. Я схватил его под\t\t\t\t\t\t\t\r\nмышки, не дав вызвать шум падения, и опустил его на зад, прислонив спиной\t\t\t\t\t\t\t\r\nк ограде справа от ворот. Однако позади послышался-таки лязг ножен другого\t\t\t\t\t\t\t\r\nратника об ограду, когда он осел, схватившись за горло. Я поспешил к нему,\t\t\t\t\t\t\t\r\nопустил его тихонько на землю и снял Фракира. Быстрый взгляд вокруг\t\t\t\t\t\t\t\r\nпоказал, что остальные ратники не смотрели в этом направлении.\t\t\t\t\t\t\t\r\nПроклятье.');

-- 
-- Вывод данных для таблицы zzusers
--
INSERT INTO zzusers VALUES
(1, 'Peter', 'pit', '123456'),
(2, 'Andrew', 'andy', '456123'),
(3, 'Matthew', 'matt', 'qwerty'),
(4, 'Selvin', 'Sel', '9756653'),
(5, 'Gelvin', 'Sel', '9756653'),
(6, 'Gelvin', 'Sel', '9756653'),
(7, 'Gelvin', 'Sel', '9756653'),
(8, 'Gelvin', 'Sel', '9756653'),
(9, 'Gelvin', 'Sel', '9756653'),
(10, 'Gelvin', 'Sel', '9756653'),
(11, 'Gelvin', 'Sel', '9756653'),
(12, 'Gelvin', 'Sel', '9756653'),
(13, 'Gelvin', 'Sel', '9756653'),
(14, 'Gelvin', 'Sel', '9756653'),
(15, 'Gelvin', 'Sel', '9756653'),
(16, 'Gelvin', 'Sel', '9756653'),
(17, 'Gelvin', 'Sel', '9756653'),
(18, 'Gelvin', 'Sel', '9756653'),
(19, 'Gelvin', 'Sel', '9756653'),
(20, 'Gelvin', 'Sel', '9756653'),
(21, 'Gelvin', 'Sel', '9756653'),
(22, 'Gelvin', 'Sel', '9756653'),
(23, 'Gelvin', 'Sel', '9756653'),
(24, 'Gelvin', 'Sel', '9756653'),
(25, 'Gelvin', 'Sel', '9756653'),
(26, 'Gelvin', 'Sel', '9756653'),
(27, 'Gelvin', 'Sel', '9756653'),
(28, 'Gelvin', 'Sel', '9756653'),
(29, 'Gelvin', 'Sel', '9756653'),
(30, 'Gelvin', 'Sel', '9756653');

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;