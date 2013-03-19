<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of template
 *
 * @author zond80
 */
class TEMPLATE extends Smarty {
    private $API = null;
    function __construct($API) {
        parent::__construct();
        $this->API = $API;
        
    }
    function render($mode=null,$action=null) {
        if (!$mode) $mode = $this->API->MODE;
        if (!$action) $action = $this->API->ACTION;
        $this->assign('mode',$mode);
        $this->assign('action',$action);
        $file = $this->API->CONFIG['TEMPLATE_PATH'].DS.$mode.DS.$action.'.tpl';
        return $this->fetch($file);
    }
    
    function output($mode=null,$action=null) {
        print $this->render($mode,$action);
    }
    function render_tv($tvcode) {
        $document = $this->API->DB->query_row("SELECT template_variables.processor, content.* FROM template_variables LEFT JOIN content ON content.id=template_variables.assigned_content_id WHERE template='{$this->API->CONFIG['template_name']}' AND code='$tvcode'");
        if (!$document) return "ERROR_NO_SUCH_TV ($tvcode)";
        else {
            //var_dump($document);
            if (!$document['processor']) return "ERROR_NO_PROCESSOR_DEFINED ($tvcode)";
        $this->assign('document',$document);
        return $this->render('processors',$document['processor']);
        }
    }
}

?>
