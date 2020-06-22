@extends('layouts.app')


@section('title', Setting::getLocalized('site.title'))

@section('description', '')
@section('body_class', 'home-page')
@section('wrapper_class', '')


@section('before_content')
@stop

@section('content')

    [infoblock code="slajder-golovna"]

    [infoblock code="opis-golovna"]

    [infoblock code="o-nas-s-kartinkoj"]

    @include('charts.index')

    @include('infoblocks.tour-preview.index')


    @include('posts.preview')

    [infoblock code="servisi-golovna"]




    [infoblock code="nashi-partneri-golovna"]

{{--    [infoblock code="korisni-posilannya-golovna"]--}}

@stop

@section('after_content')
@stop

@section('before_scripts')
@stop

@push('scripts')
@endpush
