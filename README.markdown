TabFu 0.2.0
=====

**Note**: the master branch is not stable and possibly broken. I will do my best to tag stable releases, so use those. `v0.1.0` seems to be invalid ref and I can't delete it so use `v.1.0`

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
        tab :contact, :custom_id => :two
        
        # also accepted:
        # - `tab :custom_id => :two`  # main tabs will default to :home
        # - `tab :contact; tab :custom_id => :two` # same result as current
      end
    end
    
    # layout/application.html.erb
    # ...
    <div id="menu">
      <% tabs do |tab| %> # id parameter is optional
        <%= tab.home "Go Home!", root_url %>
        <%= tab.about "About", "/about" %>
        <%= tab.users "Users", users_url %>
        <%= tab.contact "Contact", "/users/contact" %>
      <% end %>
    </div>
    
    <div id="menu-2">
      <% tabs('custom_id') do |tab| %>
        <%= tab.one "I am First!" %> # no URL parameter will default to '#'
        <%= tab.two "Second" %>
        <%= tab.three "Third" %>
        <%= tab.four "Last :(" %>
      <% end %>
    </div>
    

If you then access "/users/contact", the `#menu` div will look like:

    <div id="menu">
      <ul>
        <li class="home"><span><span><a href="/">Go Home!</a></span></span></li>
        <li class="about"><span><span><a href="/about">About</a></span></span></li>
        <li class="users"><span><span><a href="/users">Users</a></span></span></li>
        <li class="contact active"><span><span><a href="/users/contact">Contact</a></span></span></li>
      </ul>
    </div>
    
    <div id="menu-2">
      <ul id="custom_id">
        <li class="one"><span><span><a href="#">I am First!</a></span></span></li>
        <li class="two active"><span><span><a href="#">Second</a></span></span></li>
        <li class="three"><span><span><a href="#">Third</a></span></span></li>
        <li class="four"><span><span><a href="#">Last :(</a></span></span></li>
      </ul>
    </div>

To Do
=====

  - **[IMPLEMENTED]** <strike>Lists with different `id`s will be treated independently. Choosing the current
    tab will be with a syntax similar to `tab :list_id => :tab_identifier` with the 
    option to specify more than one at once.</strike> 
  - Customize list-item html (i.e. choose not to have `<span><span>` junk)
  - Tests/Specs! (for now this plug-in is just pulling code out from an existing project)
  - RDocs

Copyright
=========

Copyright (c) 2008 Bodaniel Jeanes, released under the MIT license.

In other words, go wild and fork it! Please just send back any additions!
