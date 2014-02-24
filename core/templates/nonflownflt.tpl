<?php
///////////////////////////////////////////////
///  Non Flown Flights v1.1 by php-mods.eu  ///
///            Author php-mods.eu           ///
///           Packed at 24/02/2014          ///
///     Copyright (c) 2014, php-mods.eu     ///
///////////////////////////////////////////////

?>
<h3>Pilot's Non Flown Flights</h3>
<p align="center">This is a list which includes the schedules which haven not been flown/field by you yet.</p>
<hr />
<table id="tabledlist" class="tablesorter">
<thead>
<tr>
	<th>Flight Info</th>
	<th>Options</th>
</tr>
</thead>
<tbody>
<?php $i = 0; ?>
<?php foreach($schedules as $sch) {
$flight = NonFlownFltData::pilot_field_flt($sch->depicao, $sch->arricao, $userinfo->pilotid); ?>
<?php if($flight == '0') { $i = $i+1 ?>
<tr>
<td>
		<a href="<?php echo SITE_URL; ?>/index.php/schedules/details/<?php echo $sch->id; ?>"><?php echo $sch->code; ?><?php echo $sch->flightnum; ?> (<?php echo $sch->depicao; ?>-<?php echo $sch->arricao; ?>)</a>
		<br />
		
		<strong>Departure: </strong><?php echo $sch->deptime;?> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Arrival: </strong><?php echo $sch->arrtime;?><br />
		<strong>Equipment: </strong><?php echo $sch->aircraft; ?> (<?php echo $sch->registration;?>)  
        <strong>Distance: </strong><?php echo $sch->distance; ?><?php echo Config::Get('UNITS'); ?>
		<br />
		<strong>Days Flown: </strong><?php echo Util::GetDaysCompact($sch->daysofweek); ?><br />
		<?php echo ($sch->route=='') ? '' : '<strong>Route: </strong>'.$sch->route.'<br />' ?>
		<?php echo ($sch->notes=='') ? '' : '<strong>Notes: </strong>'.html_entity_decode($sch->notes).'<br />' ?>
	</td>
	<td nowrap>
    <a href="<?php echo SITE_UR; ?>/index.php/schedules/details/<?php echo $sch->id; ?>">View Details</a><br />
	<a href="<?php echo SITE_UR; ?>/index.php/schedules/brief/<?php echo $sch->id; ?>">Pilot Brief</a><br />	
		
		<?php 
		if(Config::Get('DISABLE_SCHED_ON_BID') == true && $sch->bidid != 0)
		{
		?>
			<a id="<?php echo $sch->id; ?>" class="addbid" 
				href="<?php echo actionurl('/schedules/addbid');?>">Add to Bid</a>
		<?php
		}
		else
		{
			 ?>
				<a id="<?php echo $sch->id; ?>" class="addbid" 
					href="<?php echo url('/schedules/addbid');?>">Add to Bid</a>
			<?php			 
		}		
		?></td></tr>
<?php } ?>
<?php } ?>
<?php if($i == '0') {echo '<tr><td align="center" colspan="2">Congratulations, you have flown all our flights.</td></tr>';} ?>
</tbody>
</table>
<hr />
<?php //Please do not remove the copyright notice below as it is part of the Creative Commons License which module is licensed under. Please consider buying me a coffee. FYI, coffee in Greece costs just 1€. My PayPal email address is geo.servetas@gmail.com. //  ?>
<p align="right">Copyright &copy; <?php echo $year; ?> - <a href="http://php-mods.eu/" target="_blank"><font color="black">php-mods</font></a></p>