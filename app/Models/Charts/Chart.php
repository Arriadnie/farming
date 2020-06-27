<?php

namespace App\Models\Charts;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Chart extends Model
{
    use Translatable;
    protected $translatable = ['title', 'sub_title'];



    public function type()
    {
        return $this->belongsTo(ChartType::class, 'type_id', 'id');
    }

    public static function findBySlug($slug) {
        return static::where('slug', $slug)->with('type')->first();
    }
}
