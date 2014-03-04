<?php
///////////////////////////////////////////////
///  Non Flown Flights v1.3 by php-mods.eu  ///
///            Author php-mods.eu           ///
///           Packed at 04/03/2014          ///
///     Copyright (c) 2014, php-mods.eu     ///
///////////////////////////////////////////////

class NonFlownFltData extends CodonData {
	
	public function get_schedules() {
		$sql = "SELECT * FROM ".TABLE_PREFIX."schedules WHERE enabled='1' ORDER BY flightnum";
		return DB::get_results($sql);
	}
	public function pilot_field_flt($flightnum, $pid) {
		$query = "SELECT COUNT(pirepid) AS total FROM ".TABLE_PREFIX."pireps WHERE flightnum='$flightnum' AND pilotid='$pid' AND accepted='1'";
		$check = DB::get_row($query);
        return $check->total; 
	}
	public function aircraft($id) {
		$sql = "SELECT * FROM ".TABLE_PREFIX."aircraft WHERE id='$id'";
		return DB::get_row($sql);
	}
}
?>