<?php

/*
MASTER USER LOGIN INFO
user: SysAdmin
password: masterPW12
*****
Full name:
SysAdmin
First name:
Sys
Last name:
Admin
Email:
SysAdmin@gmail.com
Password:
masterPW12
Repeat Password:
masterPW12
*/

class CMySQL
{

    // variables
    public $sDbName;
    public $sDbUser;
    public $sDbPass;

    public $vLink;

    // constructor
    public function CMySQL()
    {
        $this->host = 'localhost';
        $this->sDbName = 'chat_system';
        $this->sDbUser = 'root';
        $this->sDbPass = '';

        if (mysqli_connect_errno()) {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
            die();
        }
        // create db link
        $this->vLink = mysqli_connect($this->host, $this->sDbUser, $this->sDbPass);

        //select the database
        mysqli_select_db($this->vLink, $this->sDbName);

        mysqli_query($this->vLink, "SET names UTF8");
    }

    // return one value result
    public function getOne($query, $index = 0)
    {
        if (!$query) {
            return false;
        }

        $res = mysqli_query($this->vLink, $query);
        $arr_res = array();
        if ($res && MYSQLI_NUM_rows($res)) {
            $arr_res = mysqli_fetch_array($res);
        }

        if (count($arr_res)) {
            return $arr_res[$index];
        } else {
            return false;
        }

    }

    // executing sql
    public function res($query, $error_checking = true)
    {
        if (!$query) {
            return false;
        }

        $res = mysqli_query($this->vLink, $query);
        if (!$res) {
            $this->error('Database query error', false, $query);
        }

        return $res;
    }

    // return table of records as result in pairs
    public function getPairs($query, $sFieldKey, $sFieldValue, $arr_type = MYSQLI_ASSOC)
    {
        if (!$query) {
            return array();
        }

        $res = $this->res($query);
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
    public function getAll($query, $arr_type = MYSQLI_ASSOC)
    {
        if (!$query) {
            return array();
        }

        if ($arr_type != MYSQLI_ASSOC && $arr_type != MYSQLI_NUM && $arr_type != MYSQLI_BOTH) {
            $arr_type = MYSQLI_ASSOC;
        }

        $res = $this->res($query);
        $arr_res = array();
        if ($res) {
            while ($row = mysqli_fetch_array($res, $arr_type)) {
                $arr_res[] = $row;
            }

            mysqli_free_result($res);
        }
        return $arr_res;
    }

    // return one row result
    public function getRow($query ,$arr_type = MYSQLI_ASSOC)
    {
        if (!$query) {
            return array();
        }

        if ($arr_type != MYSQLI_ASSOC && $arr_type != MYSQLI_NUM && $arr_type != MYSQLI_BOTH) {
            $arr_type = MYSQLI_ASSOC;
        }

        $res = $this->res($query);
        $arr_res = array();
        if ($res && MYSQLI_NUM_rows($res)) {
            $arr_res = mysqli_fetch_array($res, $arr_type);
            mysqli_free_result($res);
        }
        return $arr_res;
    }

    // escape
    public function escape($s)
    {
        return mysqli_real_escape_string($this->vLink,strip_tags($s));
    }

    // get last id
    public function lastId()
    {
        return mysqli_insert_id($this->vLink);
    }

    // display errors
    public function error($text, $isForceErrorChecking = false, $sSqlQuery = '')
    {
        echo $text;exit;
    }
}

$GLOBALS['MySQL'] = new CMySQL();
