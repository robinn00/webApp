<?php
	$MemcacheObj = new Memcache;
	$MemcacheObj->connect('localhost',11211) or die("memcached not connect");
	//$MemcacheObj->setOption(Memcached::OPT_COMPRESSION,false);


	echo("Memcached Version: ".$MemcacheObj->getVersion());
	echo("<br>");


	//add(key,value)
	$MemcacheObj->add("password","123456",MEMCACHE_COMPRESSED,0);
	echo("Password: ".$MemcacheObj->get("password"));
	echo("<br>");



	//set(key,value) get(key)
	$MemcacheObj->set("username","robinn",MEMCACHE_COMPRESSED,0);
	$username = $MemcacheObj->get('username');
	echo("Username: ".$username);
	echo("<br>");


	
	$MemcacheObj->replace("username","replaceRobinn",MEMCACHE_COMPRESSED,0);
	echo("replaceUsername: ".$MemcacheObj->get("username"));
	echo("<br>");	

	
	$arry = Array("one","two","thr");
	$MemcacheObj->add("arry",$arry,MEMCACHE_COMPRESSED,0);

	$arrys = $MemcacheObj->get("arry");
	echo($arrys[0]."<br>");
	echo($arrys[1]."<br>");
	echo($arrys[2]."<br>");


class person{
	public $name;
	public $sex;
	public $age;

	
	public function __construct($name_,$sex_,$age_){
		$this->name = $name_;
		$this->sex = $sex_;
		$this->age = $age_;
	}
	


	/*
	public function setValues($names,$sexs,$ages){
		$this->name = $names;
		$this->sex = $sexs;
		$this->age = $ages;
	}
	*/

	public function getName(){
		return $this->name;
	}

	public function getSex(){
		return $this->sex;
	}

	public function getAge(){
		return $this->age;
	}
}


/*
$p = new person();
$p->setValues("YuCheng","male","29");
echo("<hr>");
echo($p->name."<br>");
echo($p->sex."<br>");
echo($p->age."<br>");
*/

$p = new person("Chuchengs","female","35");
echo("<hr>");
echo($p->name."<br>");
echo($p->sex."<br>");
echo($p->age."<br>");

/*
$MemcacheObj->add("person",$p,MEMCACHE_COMPRESSED,0);
echo("<hr");


$p_p = $MemcacheObj->get("person");
echo($p_p->getName());
echo($p_p->getSex());
echo($p_p->getAge());
*/

echo($MemcacheObj->get("kws"));
echo($MemcacheObj->get("num"));

?>