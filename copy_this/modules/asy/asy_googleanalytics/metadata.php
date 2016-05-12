<?php
/**
 * This Software is property of Alpha-Sys and is protected by
 * copyright law - it is NOT Freeware.
 * Any unauthorized use of this software without a valid license agreement
 * will be prosecuted by civil and criminal law.
 *
 * @link        http://www.alpha-sys.de
 * @author      Fabian Kunkler <fabian.kunkler@alpha-sys.de>
 * @copyright   (C) Alpha-Sys 2008-2016
 * @module      asy_googleanalytics
 * @version     12.05.2016  1.1
 */

/**
 * Module information
 */
$sMetadataVersion = '1.1';
$aModule = array(
    'id'           => 'asy_googleanalytics',
    'title'        => '<img src="../modules/asy/module_logo.png" alt="Alpha-Sys" title="Alpha-Sys"> Google Analytics Integration (inkl. eCommerce Tracking)',
    'description'  => 'Mit diesm Modul wird Google Analytics in den Oxid Shop integriert. Sie m&uuml;ssen hierf&uuml;r nur ihren Google Account in den Modul-Einstellungen hinterlegen und das Modul aktivieren. Zus&auml;tzlich k&ouml;nnen Sie das Google Ecommerce Tracking und das Google Conversion Tracking konfigurieren.',
    'thumbnail'    => 'module_logo.png',
    'version'      => '1.1',
    'author'       => 'Alpha-Sys',
    'email'        => 'fabian.kunkler@alpha-sys.de',
    'url'          => 'http://www.alpha-sys.de',
    'extend'       => array(
        'oxviewconfig'  => 'asy/asy_googleanalytics/core/asy_googleanalytics__oxviewconfig',
    ),
    'files' => array (
    ),
    'templates' => array(
    ),
    'settings' => array(
        array('group' => 'main', 'name' => 'sGaTrackingId', 'type' => 'str', 'value' => ''),
        array('group' => 'main', 'name' => 'blGaEcommerceTracking', 'type' => 'bool', 'value' => 'false'),
        array('group' => 'main', 'name' => 'sGaConversionId', 'type' => 'str', 'value' => ''),
        array('group' => 'main', 'name' => 'sGaConversionLabel', 'type' => 'str', 'value' => ''),
    ),
    'blocks' => array(
        array('template' => 'layout/base.tpl', 'block' => 'head_css', 'file' => '/views/blocks/asy_tracking.tpl' ),
    ),
);