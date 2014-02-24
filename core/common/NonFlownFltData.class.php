<?php
///////////////////////////////////////////////
///  Non Flown Flights v1.1 by php-mods.eu  ///
///            Author php-mods.eu           ///
///           Packed at 24/02/2014          ///
///     Copyright (c) 2014, php-mods.eu     ///
///////////////////////////////////////////////

class NonFlownFltData extends CodonData {
	
	public function get_schedules() {
		$sql = "SELECT * FROM ".TABLE_PREFIX."schedules WHERE enabled='1' ORDER BY flightnum";
		return DB::get_results($sql);
	}
	public function pilot_field_flt($dep, $arr, $pid) {
		$query = "SELECT COUNT(pirepid) AS total FROM ".TABLE_PREFIX."pireps WHERE depicao='$dep' AND arricao='$arr' AND pilotid='$pid' AND accepted='1'";
		$check = DB::get_row($query);
        return $check->total; 
	}
}
?>