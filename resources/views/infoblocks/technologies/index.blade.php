<div class="technologies-wrap">
    <div class="technologies-list">
        @foreach($infoblock->items as $item)
            @include('infoblocks/technologies/item', [
                'item' => $item
            ])
        @endforeach
    </div>

</div>
