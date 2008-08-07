TabFu
=====

TabFu is a Ruby on Rails plug-in designed to ease the management of a 
tabbed interface such as an admin panel. It allows you to programmatically
create the HTML for the list-based tabs and then choose which of the tabs
is the current one at the controller, action, or view level.

Example
=======

    class ApplicationController
      tab :home # default tab, optional
    end
    
    class UsersController < ApplicationController
      tab :users
      
      def contact
        tab :contact
      end
    end
    
    # layout/application.html.erb
    # ...
    <div id="menu">
      <% tabs("menu-list") do |tab| %> # id parameter is optional
        <%= tab.home "Go Home!", root_url %>
        <%= tab.about "About", "/about" %>
        <%= tab.users "Users", users_url %>
        <%= tab.contact "Contact", "/users/contact" %>
      <% end %>
    </div>
    

If you then access "/users/contact", the `#menu` div will look like:

    <div id="menu">
      <ul id="menu-list">
        <li><span><span><a href="/">Go Home!</a></span></span></li>
        <li><span><span><a href="/about">About</a></span></span></li>
        <li><span><span><a href="/users">Users</a></span></span></li>
        <li class="active"><span><span><a href="/users/contact">Contact</a></span></span></li>
      </ul>
    </div>

To Do
=====

  - Lists with different `id`s will be treated independently. Choosing the current
    tab will be with a syntax similar to `tab :list_id => :tab_identifier` with the 
    option to specify more than one at once
  - Tests/Specs! (for now this plug-in is just pulling code out from an existing project)
  - RDocs

Copyright
=========

Copyright (c) 2008 Bodaniel Jeanes, released under the MIT license.

In other words, go wild and fork it! Please just send back any additions!
