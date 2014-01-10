module Handler.Home where

import Import

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    setTitle "Url Parsing Web Service"
    addScriptRemote "//ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"
    addStylesheetRemote "//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"

    [whamlet|
        <div .container-fluid>
          <div .row-fluid>
            <h1>Welcome to the web service
        
          <div .row-fluid>
            <div .span6>
                <h2>Url Parsing
                <p>
                    Url
                    <input #urlinput type=string value="http://google.com">
                    is
                    <br />
                    <pre #urloutput>
    |]

    
    toWidget [lucius|
        body {
            margin: 0 auto;
        }
        
        #markdowninput {
            width: 100%;
            height: 300px;
        }
        
        #markdownoutput {
            border: 1px dashed #090;
            padding: 0.5em;
            background: #cfc;
        }
    |]
    toWidget [julius|
        function updateUrl() {
            $.getJSON("/url/" + encodeURIComponent($("#urlinput").val()) + "/parts", function (o) {
                $("#urloutput").text(JSON.stringify(o, null, 4));
            });
        }
        
        $(function(){
            updateUrl();
            $("#urlinput").change(updateUrl);
            
            updateMarkdown();
            $("#updatemarkdown").click(updateMarkdown);
        });
    |]