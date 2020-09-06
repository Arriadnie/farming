<div  class="technology-item">
    <div class="image">
        <img class="lozad" data-src="{{ $item->getImage(true) }}" alt="">
    </div>

    <div class="content">
        <p class="name">{{ $item->getTranslatedAttribute('title') }}</p>
        <p class="description">{{ $item->getTranslatedAttribute('body') }}</p>
        <a class="more" href="{{ $item->button_link ?? "#" }}">
            {{ $item->getTranslatedAttribute('button_title') }}
        </a>
    </div>
</div>
