<?php

namespace App\Helpers;


class Helper
{
    public static function categories($categories, $parent_id = 0, $char = '') 
    {
        $html = '';

        foreach ($categories as $key => $cattegory) {
            if ($cattegory->parent_id == $parent_id) {
                $html .= '
                    <div class="callout callout-dark'. $char . '" style="text-transform: uppercase;">
                        <span>' . $cattegory->name . '</span>
                        <span><i class="icon-tools fas fa-trash fa-lg"></i></span>
                        <span><i class="icon-tools fas fa-eye fa-lg"></i></span>
                    </div>
                ';

                unset($categories[$key]);

                $html .= self::categories($categories, $cattegory->id, $char . ' resize');
            }
        }

        return $html;
    }

}