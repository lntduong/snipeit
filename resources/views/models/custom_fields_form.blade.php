
<style>
/* component */

.star-rating {
  border: 0;
  display: flex;
  flex-direction: row-reverse;
  font-size: 2em;
  justify-content: auto;
  text-align: center;
  width: 5em;
}

.star-rating input {
  display: none;
}

.star-rating label {
  color: rgb(128, 128, 128);
  cursor: pointer;
}

.star-rating :checked ~ label {
  color: rgb(255, 212, 59);
}

.star-rating :hover ~ label {
  color: rgb(250, 176, 5);
}
.star.star-checked {
    color: #d2dd2bcc;
}
body {
  background-color: rgb(50, 50, 50);
}
</style>
@if (($model) && ($model->fieldset))
  @foreach($model->fieldset->fields AS $field)
    <div class="form-group{{ $errors->has($field->db_column_name()) ? ' has-error' : '' }}">
      <label for="{{ $field->db_column_name() }}" class="col-md-3 control-label">{{ $field->name }} </label>
      <div class="col-md-7 col-sm-12{{ ($field->pivot->required=='1') ? ' required' : '' }}">
          @if ($field->element!='text')
              <!-- Listbox -->
              @if ($field->element=='listbox')
                  {{ Form::select($field->db_column_name(), $field->formatFieldValuesAsArray(),
                  Input::old($field->db_column_name(),(isset($item) ? $item->{$field->db_column_name()} : $field->defaultValue($model->id))), ['class'=>'format select2 form-control']) }}
              @elseif ($field->element=='rating')
              <div class="star-rating">
                @for($i=5; $i> 0; $i--)
                  @if($i > Input::old($field->db_column_name(),(isset($item) ? $item->{$field->db_column_name()} : $field->defaultValue($model->id))) )
                    <input type="radio" id="{{$i}}-stars" name="{{ $field->db_column_name() }}" value="{{$i}}" />
                    <label for="{{$i}}-stars" class="star">&bigstar;</label>
                  @else 
                     <input type="radio" id="{{$i}}-stars" name="{{ $field->db_column_name() }}" value="{{$i}}" />
                     <label for="{{$i}}-stars" class="star star-checked">&bigstar;</label>
                  @endif    
                @endfor
              </div>
                  

              @elseif ($field->element=='textarea')
                      <textarea class="col-md-6 form-control" id="{{ $field->db_column_name() }}" name="{{ $field->db_column_name() }}">{{ Input::old($field->db_column_name(),(isset($item) ? $item->{$field->db_column_name()} : $field->defaultValue($model->id))) }}</textarea>
              @elseif ($field->element=='checkbox')
                    <!-- Checkboxes -->
                  @foreach ($field->formatFieldValuesAsArray() as $key => $value)
                      <div>
                          <label>
                              <input type="checkbox" value="1" name="{{ $field->db_column_name() }}[]" class="minimal" {{ Input::old($field->db_column_name()) != '' ? ' checked="checked"' : '' }}> key: {{ $key }} value: {{ $value }}
                          </label>
                      </div>
                  @endforeach

              @endif


          @else
            <!-- Date field -->

                @if ($field->format=='DATE')

                        <div class="input-group col-md-4" style="padding-left: 0px;">
                            <div class="input-group date" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
                                <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="{{ $field->db_column_name() }}" id="{{ $field->db_column_name() }}" value="{{ Input::old($field->db_column_name(),(isset($item) ? \App\Helpers\Helper::gracefulDecrypt($field, $item->{$field->db_column_name()}) : "")) }}">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>


                @else
                    @if (($field->field_encrypted=='0') || (Gate::allows('admin')))
                    <input type="text" value="{{ Input::old($field->db_column_name(),(isset($item) ? \App\Helpers\Helper::gracefulDecrypt($field, $item->{$field->db_column_name()}) : $field->defaultValue($model->id))) }}" id="{{ $field->db_column_name() }}" class="form-control" name="{{ $field->db_column_name() }}" placeholder="Enter {{ strtolower($field->format) }} text">
                        @else
                            <input type="text" value="{{ strtoupper(trans('admin/custom_fields/general.encrypted')) }}" class="form-control disabled" disabled>
                    @endif
                @endif

          @endif

              @if ($field->help_text!='')
              <p class="help-block">{{ $field->help_text }}</p>
              @endif

          <?php
          $errormessage=$errors->first($field->db_column_name());
          if ($errormessage) {
              $errormessage=preg_replace('/ snipeit /', '', $errormessage);
              print('<span class="alert-msg"><i class="fa fa-times"></i> '.$errormessage.'</span>');
          }
            ?>
      </div>

        @if ($field->field_encrypted)
        <div class="col-md-1 col-sm-1 text-left">
            <i class="fa fa-lock" data-toggle="tooltip" data-placement="top" title="{{ trans('admin/custom_fields/general.value_encrypted') }}"></i>
        </div>
        @endif


    </div>
  @endforeach
@endif
<script>

</script>