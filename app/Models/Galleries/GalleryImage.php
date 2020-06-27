<?php

namespace App\Models\Galleries;

use App\Traits\Imageable;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use TCG\Voyager\Facades\Voyager;

class GalleryImage extends Model
{
    use Translatable,
        Imageable;

    protected $image_column = 'image';

    protected $guarded = [];

    protected $translatable = ['caption'];



    /**
     * Return the Highest Order Infoblock Item.
     *
     * @return number Order number
     */
    public static function highestOrderInfoblockItem()
    {
        $order = 1;

        $item = static::orderBy('order', 'DESC')
            ->first();

        if (!is_null($item)) {
            $order = intval($item->order) + 1;
        }

        return $order;
    }

    public function isVideo() {
        return $this->video != null && $this->video != '';
    }

    public function getVideo() {
        return Voyager::image(json_decode($this->video)[0]->download_link);
    }
}
