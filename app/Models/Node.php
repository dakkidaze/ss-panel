<?php

namespace App\Models;
use App\Models\TrafficLog;
use App\Utils\Tools;
/**
 * Node Model
 */

class Node extends Model

{
    protected $table = "ss_node";
	public function avgFlow(){
		$lastminupload = TrafficLog::where('log_time','>',(time()-60))->where('log_time','<=',time())->where('node_id',$this->attributes['id'])->sum('u');
		$lastmindownload = TrafficLog::where('log_time','>',(time()-60))->where('log_time','<=',time())->where('node_id',$this->attributes['id'])->sum('d');
		return Tools::flowAutoShow(($lastminupload+$lastmindownload)/60)."/s";
	}
	public function avgPpl(){
		$lastminuser = TrafficLog::where('log_time','>',(time()-60))->where('log_time','<=',time())->where('node_id',$this->attributes['id'])->count('user_id');
		return $lastminuser;
	}
}
