<div class="service-wrap">
    <p class="block-title left">{{ $infoblock->getTranslatedAttribute('title') }}</p>
    <div class="service-slider">

        @foreach($infoblock->items as $item)
            @include('infoblocks/poslugi/item', [
                'item' => $item
            ])
        @endforeach


    </div>
</div>
