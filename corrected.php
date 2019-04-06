<?php
class CMySQL {
// constructor
function CMySQL() {
$hostname = "sql103.epizy.com";
$dbname = "epiz_23660691_delsuchat";
$username ="epiz_23660691";
$password = "zb6SRALzTwe91vS";
//connection to the database
$dbhandle = mysqli_connect($hostname, $username, $password)
 or die("Unable to connect to MySQL");
echo "<br>";
//select a database to work with
$selected = mysqli_select_db($dbhandle,$dbname)
  or die("Could not select examples");
echo "<br>";
mysqli_query("SET names UTF8");
}
// return one value result
function getOne($dbhandle, $main = 0) {
if (! $dbhandle)
return false;
$res = mysqli_query($dbhandle);
$arr_res = array();
if ($res && mysqli_num_rows($res))
$arr_res = mysqli_fetch_array($res);
if (count($arr_res))
return $arr_res[$main];
else
return false;
}
// executing sql
function res($dbhandle, $error_checking = true) {
if(!$dbhandle)
return false;
$res = mysqli_query($dbhandle, $dbname);
if (!$res)
$error('Could not connect to MySQL', false, $dbhandle);
return $res;
}
// return table of records as result in pairs
function getPairs($dbhandle, $sFieldKey, $sFieldValue, $arr_type = MYSQLI_ASSOC) {
if (! $dbhandle)
return array();
$res = $this->res($dbhandle);
$arr_res = array();
if ($res) {
while ($row = mysqli_fetch_array($res, MYSQLI_ASSOC)) {
$arr_res[$row[$sFieldKey]] = $row[$sFieldValue];
}
mysqli_free_result($res);
}
return $arr_res;
}
// return table of records as result
function getAll($dbhandle, $arr_type = MYSQLI_ASSOC) {
if (! $dbhandle)
return array();
if ($arr_type != MYSQLI_ASSOC && $arr_type != MYSQLI_NUM && $arr_type != MYSQLI_BOTH)
$arr_type = MYSQLI_ASSOC;
$res = $this->res($dbhandle);
$arr_res = array();
if ($res) {
while ($row = mysqli_fetch_array($res, $arr_type))
$arr_res[] = $row;
mysqli_free_result($res);
}
return $arr_res;
}
// return one row result
function getRow($dbhandle, $arr_type = MYSQLI_ASSOC) {
if(!$dbhandle)
return array();
if($arr_type != MYSQLI_ASSOC && $arr_type != MYSQLI_NUM && $arr_type != MYSQLI_BOTH)
$arr_type = MYSQLI_ASSOC;
$res = $this->res ($dbhandle);
$arr_res = array();
if($res && mysqli_num_rows($res)) {
$arr_res = mysqli_fetch_array($res, $arr_type);
mysqli_free_result($res);
}
return $arr_res;
}
// escape
function escape($s) {
return mysqli_real_escape_string(strip_tags($s));
}
// get last id
function lastId() {
return mysqli_insert_id($dbhandle);
}
// display errors
function error($text, $isForceErrorChecking = false, $sSqlQuery = '') {
echo $text; exit;
}
}
$GLOBALS['MySQL'] = new CMySQL();