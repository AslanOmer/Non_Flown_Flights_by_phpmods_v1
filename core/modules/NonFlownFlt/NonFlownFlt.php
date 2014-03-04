<?php
///////////////////////////////////////////////
///  Non Flown Flights v1.3 by php-mods.eu  ///
///            Author php-mods.eu           ///
///           Packed at 04/03/2014          ///
///     Copyright (c) 2014, php-mods.eu     ///
///////////////////////////////////////////////

class NonFlownFlt extends CodonModule {
	
	public function index() {
		if(!Auth::LoggedIn())
	    {
	    $this->set('message', 'You must be logged in to access this feature!');
		$this->render('core_error.tpl');
		return;
		}
		$this->set('userinfo', Auth::$userinfo);
		$this->set('schedules', NonFlownFltData::get_schedules());
		$this->render('nonflownflt.tpl');
	}
}
?>