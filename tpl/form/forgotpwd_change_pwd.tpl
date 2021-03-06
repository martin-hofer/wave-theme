[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

<form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post" role="form"  novalidate="novalidate">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="updatePassword">
        <input type="hidden" name="uid" value="[{$oView->getUpdateId()}]">
        <input type="hidden" name="cl" value="forgotpwd">
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
    </div>

    <div class="form-group row[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
        <label class="col-sm-3">[{oxmultilang ident="NEW_PASSWORD"}]</label>
        <div class="col-md-9">
            <input type="password" name="password_new" class="form-control js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match textbox">
        </div>
        <p class="help-block"></p>
    </div>
    <div class="form-group row[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
        <label class="col-md-3">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
        <div class="col-md-9">
            <input type="password" name="password_new_confirm" class="form-control js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match textbox">
        </div>
        <p class="help-block"></p>
    </div>
    <div class="form-group row">
        <div class="col-md-9 offset-md-3">
            <button class="btn btn-primary submitButton" type="submit" name="save" value="[{oxmultilang ident="CHANGE_PASSWORD"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</button>
        </div>
    </div>
</form>