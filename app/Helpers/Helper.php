<?php

namespace App\Helpers;


class Helper
{
    public static function categories($categories, $parent_id = 0, $char = '')
    {
        $html = '';

        foreach ($categories as $key => $category) {
            if ($category->parent_id == $parent_id) {
                $html .= '
                    <div class="callout callout-dark' . $char . '" style="text-transform: uppercase;">
                        <span>' . $category->name . '</span>
                        <span onclick="remove(' . $category->id . ', \'/admin/category/destroy\')" class="icon-delete"><i class="icon-tools fas fa-trash fa-lg"></i></span>
                        <a href="/admin/category/edit/' . $category->id . '" class="icon-edit"><span><i class="icon-tools fas fa-tasks fa-lg"></i></span></a>
                        <span>' . self::active($category->active) . '</span>
                    </div>
                ';

                unset($categories[$key]);

                $html .= self::categories($categories, $category->id, $char . ' resize');
            }
        }

        return $html;
    }

    public static function active($active = 0)
    {
        return $active == 0 ? '<i class="icon-tools fas fa-eye fa-lg icon-not-active"></i>' : '<i class="icon-tools fas fa-eye fa-lg icon-active"></i>';
    }
}
