{% extend 'htmlbase.tpl' %}
{% msg %}Generating HTML output for module {{ compound.name }}{% endmsg %}

{% block navpath %}
{% with navpath=compound.navigationPath %}
  {% include 'htmlnavpath.tpl' %}
{% endwith %}
{% endblock %}

{% block title %}
  {# write summary links in the title area #}
  <div class="summary">
  {% with first=True %}
    {% if compound.modules %}
      <a href="#modules">{{ tr.modules }}</a>
      {% set first=False %}
    {% endif %}
    {% if compound.dirs %}
      <a href="#dirs">{{ tr.dirs }}</a>
      {% set first=False %}
    {% endif %}
    {% if compound.files %}
      <a href="#files">{{ tr.files }}</a>
      {% set first=False %}
    {% endif %}
    {% if compound.classes %}
      <a href="#classes">{{ tr.classes }}</a>
      {% set first=False %}
    {% endif %}
    {% if compound.namespaces %}
      {% if not first %} &#124; {% endif %}
      <a href="#namespaces">{{ tr.namespaces }}</a>
      {% set first=False %}
    {% endif %}
    {% if compound.constantgroups %}
      {% if not first %} &#124; {% endif %}
      <a href="#constantgroups">{{ tr.constantgroups }}</a>
      {% set first=False %}
    {% endif %}
    {% with memberListInfo=compound.macros %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.typedefs %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.enums %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.enumvalues %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.functions %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.variables %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.signals %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.publicSlots %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.protectedSlots %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.privateSlots %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.events %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.properties %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
    {% with memberListInfo=compound.friends %}
      {% include 'htmlmemsummary.tpl' %}
    {% endwith %}
  {% endwith %}
  </div>
  {{ block.super }}
{% endblock %}

{% block content %}
<div class="contents">
{# brief description #}
  {% if compound.brief %}
    {{ compound.brief }}
    {% if compound.hasDetails %}
      <a href="#details">{{ tr.more }}</a>
    {% endif %}
  {% endif %}
{# group graph #}
  {% if compound.hasGroupGraph %}
    {% with obj=compound %}
      {% include 'htmldynheader.tpl' %}
    {% endwith %}
      {{ tr.collaborationDiagramFor:compound.name }}
    </div>
    {% with obj=compound %}
      {% include 'htmldyncontents.tpl' %}
    {% endwith %}
      {{ compound.groupGraph }}
    </div>
  {% endif %}
{# member declarations #}
  {# modules #}
    {% with list=compound.modules label='modules' title=tr.modules local=False %}
      {% include 'htmldeclcomp.tpl' %}
    {% endwith %}
  {# dirs #}
    {% with list=compound.dirs, label='dirs' title=tr.directories local=False %}
      {% include 'htmldeclcomp.tpl' %}
    {% endwith %}
  {# files #}
    {% with list=compound.files, label='files' title=tr.files local=False %}
      {% include 'htmldeclcomp.tpl' %}
    {% endwith %}
  {# namespaces #}
    {% with list=compound.namespaces, label='namespaces' title=tr.namespaces local=False %}
      {% include 'htmldeclcomp.tpl' %}
    {% endwith %}
  {# classes #}
    {% with list=compound.classes label='classes' title=tr.classes local=False %}
      {% include 'htmldeclcomp.tpl' %}
    {% endwith %}
  {# constantgroups #}
    {% with list=compound.constantgroups, label='constantgroups' title=tr.constantgroups local=False %}
      {% include 'htmldeclcomp.tpl' %}
    {% endwith %}
  {# defines #}
    {% with memberListInfo=compound.macros %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# typedefs #}
    {% with memberListInfo=compound.typedefs %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# enums #}
    {% with memberListInfo=compound.enums %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# enum values #}
    {% with memberListInfo=compound.enumvalues %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# functions #}
    {% with memberListInfo=compound.functions %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# variables #}
    {% with memberListInfo=compound.variables %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# signals #}
    {% with memberListInfo=compound.signals %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# public slots #}
    {% with memberListInfo=compound.publicSlots %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# protected slots #}
    {% with memberListInfo=compound.protectedSlots %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# private slots #}
    {% with memberListInfo=compound.privateSlots %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# private events #}
    {% with memberListInfo=compound.events %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# private properties #}
    {% with memberListInfo=compound.properties %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# private friends #}
    {% with memberListInfo=compound.friends %}
      {% include 'htmlmemdecls.tpl' %}
    {% endwith %}
  {# membergroups #}
    {% if compound.memberGroups %}
      {% for memberListInfo in compound.memberGroups %}
        {% include 'htmlmemdecls.tpl' %}
      {% endfor %}
    {% endif %}
{# end member declarations #}
{# detailed description #}
{% if compound.hasDetails %}
  {# anchor #}
  <a name="details" id="details"></a>
  {# header #}
  <h2 class="groupheader">{{ tr.detailedDesc }}</h2>
  <div class="textblock">
  {# brief #}
  {% if compound.brief and config.REPEAT_BRIEF %}
    <p>
    {{ compound.brief }}
    </p>
  {% endif %}
  {# details #}
  {{ compound.details }}
  {# source definition #}
  {% if compound.sourceDef %}
    {% markers obj in compound.sourceDef with tr.definedAtLineInSourceFile %}
      {% with text=obj.text %}
        {% include 'htmlobjlink.tpl' %}
      {% endwith %}
    {% endmarkers %}
  {% endif %}
  </div>
{% endif %}
{# member definitions #}
  {# inline classes #}
    {% if compound.inlineClasses %}
      <h2 class="groupheader">{{ tr.classDocumentation }}</h2>
      {% for class in compound.inlineClasses %}
        {# write anchor #}
        <a class="anchor" id="{{ class.anchor }}"></a>
        <div class="memitem">
        <div class="memproto">
        <table class="memname">
          <tr><td class="memname">{{ class.compoundType }} {{ class.name }}</td></tr>
        </table>
        </div>
        <div class="memdoc">
        <div class="textblock">
        {# TODO: the stuff inside textblock can be the same as in htmlclass.tpl!! #}
          {# template specifier #}
          {% if class.language=='cpp' and class.templateDecls %}
            <h3>{% spaceless %}
              {% for targList in class.templateDecls %}
                template&lt;
                {% for targ in targList %}
                  {{ targ.type }}{% if targ.name %} {{ targ.name }}{% endif %}{% if targ.defVal %}&#160;= {{ targ.defVal }}{% endif %}{% if not forloop.last %}, {% endif %}
                {% endfor %}
                &gt;<br/>
              {% endfor %}
            {% endspaceless %}
            {{ class.classType }}&#160;{{ class.name }}
            </h3>
          {% endif %}
          {# brief description #}
          {% if class.brief and config.REPEAT_BRIEF %}
            <p>{{ class.brief }}</p>
          {% endif %}
          {# detailed docs #}
          {{ class.details }}
          {# source def #}
          {% if class.sourceDef %}
            {% markers obj in class.sourceDef with tr.definedAtLineInSourceFile %}
              {% with text=obj.text %}
                {% include 'htmlobjlink.tpl' %}
              {% endwith %}
            {% endmarkers %}
          {% endif %}
        </div><!-- textblock -->
        {# table with fields #}
        <table class="fieldtable">
          <tr><th colspan="3">{{ tr.compoundMembers }}</td></tr>
          {% for member in class.members %}
            <tr><td class="fieldtype">
                   <a class="anchor" id="{{ member.anchor }}"></a>{{ member.fieldType }}
                </td>
                <td class="fieldname">
                   {{ member.name }}
                   {% if member.isVariable and member.declArgs %}{{ member.declArgs }}{% endif %}
                   {{ member.bitfields }}
                </td>
                <td class="fielddoc">
                  {% if member.brief and not member.details %}{# only brief #}
                    {{ member.brief }}
                  {% else %} {# only details or both #}
                    {% if member.brief %}<p>{{ member.brief }}</p>{% endif %}
                    {{ member.details }}
                  {% endif %}
                </td>
            </tr>
          {% endfor %}
        </table>
        </div><!-- memdoc -->
        </div><!-- memitem -->
      {% endfor %}
    {% endif %}
  {# defines #}
    {% with memberListInfo=compound.detailedMacros %}
      {% include 'htmlmemdef.tpl' %}
    {% endwith %}
  {# typedefs #}
    {% with memberListInfo=compound.detailedTypedefs %}
      {% include 'htmlmemdef.tpl' %}
    {% endwith %}
  {# enums #}
    {% with memberListInfo=compound.detailedEnums %}
      {% include 'htmlmemdef.tpl' %}
    {% endwith %}
  {# functions #}
    {% with memberListInfo=compound.detailedFunctions %}
      {% include 'htmlmemdef.tpl' %}
    {% endwith %}
  {# variables #}
    {% with memberListInfo=compound.detailedVariables %}
      {% include 'htmlmemdef.tpl' %}
    {% endwith %}
{# end member definitions #}
</div>
{% endblock %}

