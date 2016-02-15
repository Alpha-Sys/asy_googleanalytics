<?php
/**
 * This Software is property of Alpha-Sys and is protected by
 * copyright law - it is NOT Freeware.
 * Any unauthorized use of this software without a valid license agreement
 * will be prosecuted by civil and criminal law.
 *
 * @link        http://www.alpha-sys.de
 * @author      Fabian Kunkler <fabian.kunkler@alpha-sys.de>
 * @copyright   (C) Alpha-Sys 2008-2015
 * @module      asy_googleanalytics
 * @version     17.11.2015  1.0
 */

class asy_googleanalytics__oxviewconfig extends asy_googleanalytics__oxviewconfig_parent {

	public function getGaTrackingId(){
		return oxRegistry::getConfig()->getConfigParam('sGaTrackingId'); 
	}
	
	public function isGaEcommerceTrackingActive(){
		return oxRegistry::getConfig()->getConfigParam('blGaEcommerceTracking'); 
	}
}
