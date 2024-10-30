<?php
function AutoVersioning($url){
    switch ($_SERVER['SERVER_NAME']) {
        case PRODUCTION:
            $path = pathinfo($url);
            if(stristr($url,'.css'))
            {
                $ver = '.min.'.filemtime($_SERVER['DOCUMENT_ROOT'].$url).'';
                return $path['dirname'].'/'.str_replace('.min', $ver, $path['basename']);
            }
            elseif(stristr($url,'.js'))
            {
                $ver = '.'.filemtime($_SERVER['DOCUMENT_ROOT'].$url).'.';
                return $path['dirname'].'/'.str_replace('.', $ver, $path['basename']);
            }
            
        break;
        default:
        return $url;
        break;
    }
}
?>