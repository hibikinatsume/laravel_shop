<?php

namespace App\Helpers;

use Illuminate\Support\Str;

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

    public static function  categories_home($data, $parent_id = 0)
    {
        $html = '';
        foreach ($data as $key => $category) {
            if ($category->parent_id == $parent_id) {
                $html .= '
                <li>
                    <a href="/danh-muc/"' .$category->id . '-' . Str::slug($category->name, '-') . '.html">' . $category->name . '</a>';
                if (self::isChild($data, $category->id)) {
                    $html .= '<ul class="sub-menu">';
                    $html .= self::categories_home($data, $category->id);
                    $html .= '</ul>';
                }

                $html .= '</li>';
            }
        }

        return $html;
    }

    public static function isChild($categories, $id)
    {
        foreach($categories as  $category) {
            if ($category->parent_id == $id) {
                return true;
            }
        }

        return false;
    }

    public static function price($price = 0, $price_sale = 0)
    {
        if ( $price_sale != 0 ) return number_format($price_sale);
        if ( $price != 0 ) return number_format($price);

        return '<a href="/lien-he.html">Liên hệ</a>';
    }
}
