class <%= class_name %> < TablelessModel
<% for attribute in attributes -%>
  column :<%= attribute.name %>, :<%= attribute.type %>
<% end -%>
end