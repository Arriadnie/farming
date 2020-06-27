<?php

namespace App\Models\Infoblocks;

use App\Traits\Imageable;
use App\Traits\Linkable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use TCG\Voyager\Facades\Voyager;

class InfoblockItem extends Model
{
    use Translatable,
        Imageable,
        Linkable;

    protected $image_column = 'image';

    protected $guarded = [];

    protected $translatable = ['title', 'sub_title', 'body', 'button_title'];

    public function children()
    {
        return $this->hasMany(self::class, 'parent_id');
    }

    public function scopeFirstLevel(Builder $query, int $count = 0)
    {
        return $query->whereNull('parent_id');
    }


    public function isVideo() {
        return $this->video != null && $this->video != '';
    }

    public function getVideo() {
        return Voyager::image(json_decode($this->video)[0]->download_link);
    }


}
