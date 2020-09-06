
<a href="{{ $image->isVideo() ? $image->getVideo() : $image->getImage(true) }}"
   class="@if($counter == 0 || $counter == 3) small @elseif($counter == 1 || $counter == 2) big @endif"
   data-fancybox="{{ $gallery->slug }}"
   @if($counter >= 4) style="display: none" @endif>
    @if($counter < 4)
        @if($image->isVideo())
            <span class="play-btn">
                <svg><use xlink:href="#play"></use></svg>
            </span>
        @endif
    <img class="lozad" data-src="{{ $image->getImage(true) }}" alt="{{ $image->getTranslatedAttribute('title') }}" >
    @endif
</a>
