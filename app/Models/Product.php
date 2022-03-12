<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'desc',
        'content',
        'thumb',
        'price',
        'price_sale',
        'category_id',
        'active',
    ];

    public function category()
    {
        return $this->hasOne(Category::class, 'id', 'category_id')->withDefault(['name' => '']);
    }
}
