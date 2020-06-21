<div class="gallery-wrap">
    @if($gallery->getTranslatedAttribute('title') )
        <p class="block-title left">{{ $gallery->getTranslatedAttribute('title') }}</p>

    @endif

    <div class="gallery">
        @php($counter = 0)

        @foreach($gallery->images as $image)
            @include('galleries/item', [
                'image' => $image,
                'counter' => $counter++
            ])
        @endforeach

    </div>

</div>
