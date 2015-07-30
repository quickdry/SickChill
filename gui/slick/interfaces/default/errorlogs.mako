<%!
    import sickbeard
    from sickbeard import classes
    from sickbeard.common import *
    global header="Logs &amp; Errors"
    global title="Logs &amp; Errors"

    global sbPath = ".."

    global topmenu="errorlogs"#
    import os.path
    include file=os.path.join(sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_top.mako")
%>
% if not header is UNDEFINED:
    <h1 class="header">${header}</h1>
% else
    <h1 class="title">${title}</h1>
% endif
<div class="align-left"><pre>
% if classes.ErrorViewer.errors:
    % for curError in sorted(classes.ErrorViewer.errors, key=lambda error: error.time, reverse=True)[:500]:
        % filter WebSafe
${curError.time} ${curError.message}
        % end filter
    % endfor
% endif
</pre>
</div>

<script type="text/javascript" charset="utf-8">
<!--
window.setInterval( "location.reload(true)", 600000); // Refresh every 10 minutes
//-->
</script>

% include file=os.path.join(sickbeard.PROG_DIR, "gui/slick/interfaces/default/inc_bottom.mako")
