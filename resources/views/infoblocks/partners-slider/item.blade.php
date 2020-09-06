<div class="partner-slide-wrap">
    <a target="_blank" href="{{ $item->button_link ?? "#" }}" class="partner-item">
        <img class="lozad" data-src="{{ $item->getImage(true) }}" alt="">
    </a>
    {{--    {{ $item->getTranslatedAttribute('title') }}--}}
</div>
