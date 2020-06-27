@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        th, td {
            border: 1px solid #000000;
        }
    </style>
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">
                    <!-- form start -->
                    <form role="form"
                            class="form-edit-add"
                            action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
                            method="POST" enctype="multipart/form-data">
                        <!-- PUT Method if we are editing -->
                        @if($edit)
                            {{ method_field("PUT") }}
                        @endif

                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">

                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <!-- Adding / Editing -->
                            @php
                                $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                            @endphp

                            @foreach($dataTypeRows as $row)
                                <!-- GET THE DISPLAY OPTIONS -->
                                @php
                                    $display_options = $row->details->display ?? NULL;
                                    if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                        $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                    }
                                @endphp
                                @if (isset($row->details->legend) && isset($row->details->legend->text))
                                    <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                @endif

                                <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                    {{ $row->slugify }}
                                    <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                                    @include('voyager::multilingual.input-hidden-bread-edit-add')
                                    @if (isset($row->details->view))
                                        @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                    @elseif ($row->type == 'relationship')
                                        @include('voyager::formfields.relationship', ['options' => $row->details])
                                    @else
                                        {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                    @endif

                                    @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                        {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                    @endforeach
                                    @if ($errors->has($row->field))
                                        @foreach ($errors->get($row->field) as $error)
                                            <span class="help-block">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>
                            @endforeach

                        </div><!-- panel-body -->

                        <div class="panel-body">
                            <table id="chart-data-grid">
                                <tr id="chart-data-grid-captions">
                                    <th>
                                        Значения
                                    </th>
                                </tr>
                            </table>

                            <button id="chart-data-add-row" class="btn btn-primary save">Добавить строку</button>
                            <button id="chart-data-add-column" class="btn btn-primary save">Добавить колонку</button>
                        </div>



                        <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                            @stop
                            @yield('submit-buttons')
                        </div>
                    </form>

                    <iframe id="form_target" name="form_target" style="display:none"></iframe>
                    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                            enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                        <input name="image" id="upload_file" type="file"
                                 onchange="$('#my_form').submit();this.value='';">
                        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                        {{ csrf_field() }}
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Delete File Modal -->



@stop

@section('javascript')
    <script>
        var params = {};
        var $file;

        function deleteHandler(tag, isMulti) {
          return function() {
            $file = $(this).siblings(tag);

            params = {
                slug:   '{{ $dataType->slug }}',
                filename:  $file.data('file-name'),
                id:     $file.data('id'),
                field:  $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
          };
        }

        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                } else if (elt.type != 'date') {
                    elt.type = 'text';
                    $(elt).datetimepicker({
                        format: 'L',
                        extraFormats: [ 'YYYY-MM-DD' ]
                    }).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
                $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });

        $('#chart-data-add-row').on('click', function(e) {
            e.preventDefault();
            tableGrid.addRow();
        });

        $('#chart-data-add-column').on('click', function(e) {
            e.preventDefault();
            tableGrid.addColumn();
        });



        class TableGrid {
            constructor(id) {
                this.element = $('#' + id);
                this.tbody = $(this.element.children()[0]);
                this.captions = $(this.tbody.children()[0])

                this.columns = [];
                this.rows = [];
                this.cells = [];
                this.currentColumn = 0;
                this.currentRow = 0;
            }


            addRow(caption, dataRow) {
                let rowId = this.currentRow++;

                let rowElement = $('<tr>').attr('id', 'grid-row-' + rowId);

                let trd = $('<td>').append(
                    this._createInput('grid-row-' + rowId, caption)
                ).append(
                    this._createDeleteButton(rowId, this.deleteRow.bind(this))
                ).attr('id', 'grid-td-row-' + rowId);
                rowElement.append(trd);

                let rowArray = [];
                for (let i = 0; i < this.columns.length; i++) {
                    let columnId = this.columns[i].id;
                    let td = $('<td>').append(
                        this._createInput('grid-cell-' + columnId + '-' + rowId, dataRow ? dataRow[i] : null)
                    ).attr('id', 'grid-th-cell-' + columnId + '-' + rowId);

                    rowArray.push({
                        columnId: columnId,
                        rowId: rowId,
                        element: td
                    });

                    rowElement.append(td);
                }

                this.rows.push({
                    id: rowId,
                    element: rowElement
                });
                this.cells.push(rowArray);
                this.tbody.append(rowElement);
            }
            deleteRow(id) {
                let rowIndex = this.rows.findIndex(c => c.id === id);
                this.rows[rowIndex].element.remove();
                this.rows.splice(rowIndex, 1);
                this.cells.splice(rowIndex, 1);
            }


            addColumn(caption) {
                let columnId = this.currentColumn++;

                let th = $('<th>').append(
                    this._createInput('grid-column-' + columnId, caption)
                ).append(
                    this._createDeleteButton(columnId, this.deleteColumn.bind(this))
                ).attr('id', 'grid-th-column-' + columnId);
                this.captions.append(th);

                this.columns.push({
                    id: columnId,
                    element: th
                });

                for (let i = 0; i < this.rows.length; i++) {
                    let rowId = this.rows[i].id;
                    let td = $('<td>').append(
                        this._createInput('grid-cell-' + columnId + '-' + rowId)
                    ).attr('id', 'grid-th-cell-' + columnId + '-' + rowId);

                    this.cells[i].push({
                        columnId: columnId,
                        rowId: rowId,
                        element: td
                    });

                    $('#grid-row-' + rowId).append(td);
                }
            }
            deleteColumn(id) {
                let columnIndex = this.columns.findIndex(c => c.id === id);
                this.columns[columnIndex].element.remove();
                this.columns.splice(columnIndex, 1);

                for (let i = 0; i < this.rows.length; i++) {
                    this.cells[i][columnIndex].element.remove();
                    this.cells[i].splice(columnIndex, 1);
                }
            }


            _createInput(name, value, type = 'text') {
                let input = $('<input>');
                input.attr('type', type);
                input.attr('name', name);
                input.attr('name', name);
                if (value) {
                    input.attr('value', value);
                }
                return input;
            }
            _createDeleteButton(id, callback) {
                let span = $('<span>');
                span.html('X');
                span.on('click', () => {
                    callback(id);
                });
                return span;
            }

            getColors(count, apacity) {
                const baseColors = [
                    "rgba(75, 192, 192, " + apacity + ")",
                    "rgba(255, 99, 132, " + apacity + ")",
                    "rgba(54, 162, 235, " + apacity + ")",
                    "rgba(255, 206, 86, " + apacity + ")",
                    "rgba(153, 102, 255, " + apacity + ")",
                    "rgba(255, 159, 64, " + apacity + ")"
                ];
                let colors = [];
                while (colors.length < count) {
                    colors = colors.concat(baseColors);
                }
                return colors.slice(0, count);
            }

            getData() {
                let datasets = [];

                for (let i = 0; i < this.rows.length; i++) {
                    datasets.push({
                        label: $(this.rows[i].element.children()[0]).children()[0].value,
                        data: this.cells[i].map(c => c.element.children()[0].value),
                        backgroundColor: this.getColors(this.cells[i].length, 0.2),
                        borderColor: this.getColors(this.cells[i].length, 1),
                        borderWidth: 1
                    });
                }

                return {
                    labels: this.columns.map(c => c.element.children()[0].value),
                    datasets: datasets
                }
            }


            initData(data) {
                for (let i in data.labels) {
                    this.addColumn(data.labels[i]);
                }
                for (let i in data.datasets) {
                    this.addRow(data.datasets[i].label, data.datasets[i].data);
                }
            }

        }

        var tableGrid = new TableGrid('chart-data-grid');

        $('input[name="data_json"]').parent().hide();
        var jsonStr = $('input[name="data_json"]').val();
        if (jsonStr) {
            tableGrid.initData(JSON.parse(jsonStr));
        }


        $('button[type="submit"]').on('click', function(e) {
            e.preventDefault();

            $('input[name="data_json"]').val(JSON.stringify(tableGrid.getData()));

            $('form').submit();
        });

    </script>
@stop
