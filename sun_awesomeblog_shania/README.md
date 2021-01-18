## **BOOTSTRAP INTEGRATION**
Source for most of the steps: https://code-and-cookies.com/2020/01/new-rails-6-project/

Step 1: Install boostrap with yarn
```
$ yarn add bootstrap jquery popper.js
```

Step 2: Go to **environment.js** and replace the whole code into this
```javascript
import { environment } from '@rails/webpacker'
const webpack = require('webpack')
environment.plugins.append('Provide', 
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Popper: ['popper.js', 'default']
    })
)
export default environment
```
Source for this Step: https://www.youtube.com/watch?v=cWkISBYM_0g

Step 3: Go to **application.js** and add this line
```javascript
import 'bootstrap';
```

Step 4: Rename **application.css** to **application.scss**, then add this
```scss
@import "bootstrap/scss/bootstrap";
```
---

## **FONT AWESOME INTEGRATION**
Source: https://hackernoon.com/integrate-bootstrap-4-and-font-awesome-5-in-rails-6-u87u32zd

Step 1: Install boostrap with yarn
```
$ yarn add @fortawesome/fontawesome-free 
```

Step 2: Add following line in **application.js**
```javascript
import '@fortawesome/fontawesome-free/js/all';
```

Step 3: Add following line in **application.scss**
```scss
@import "@fortawesome/fontawesome-free/css/all.css";
```
Source for this Step: https://stackoverflow.com/questions/55989717/installing-font-awesome-in-rails-6-0-0-rc1-with-webpacker-and-yarn

Step 4: Add following gem into your project
```ruby
gem 'font_awesome5_rails'
```

Step 5: Restart your docker container to install gem

---

## **Gem 'bcrypt' & has_secure_password**
Source: https://www.chatwork.com/#!rid68093076-1322031853334429696
(if cannot access this link,
use "The Ruby on Rails tutorial" book by Michael Hartl, sixth edition that covers Rails 6)

Step 1:  Make sure you have this single Rails method in the User model
```ruby
has_secure_password
```

Step 2: Add password_digest to your **User migration file**
```ruby
t.string :password_digest
```
_Note: After every change in the **db** folder, migrate to database with the command_
```ruby
$ rails db:migrate
```

Step 3: Add following gem in **Gemfile** as specified in the book then **bundle install** in your terminal
```ruby
gem 'bcrypt', '3.1.13'
```
_Note: Version may vary; this is the version used when this application was first made_

Step 4: Add the ff. validation in the User model with **allow_blank: true**
```ruby
validates :password, presence: true, length: { minimum: 6 }, allow_blank: true
```
_Note: length may vary; allow_blank: true allows the default validation to be true and pass which leaves only the "has_secure_password" to send the necessary message_

Source: https://books.google.com.ph/books?id=ePuCDQAAQBAJ&pg=PT564&lpg=PT564&dq=allow_blank:+true+has_secure_password&source=bl&ots=0yvJ8IJ34J&sig=ACfU3U34pZQMB4zLblF-3KS_MlxaFxy6lA&hl=en&sa=X&ved=2ahUKEwiFkZqhsZjqAhXVQN4KHZF5A9oQ6AEwAHoECAoQAQ#v=onepage&q=allow_blank%3A%20true%20has_secure_password&f=false

---


## **SSL Integration for faster security approval in Production**
Source: https://www.chatwork.com/#!rid68093076-1322031853334429696
(if cannot access this link,
use "The Ruby on Rails tutorial" book by Michael Hartl, sixth edition that covers Rails 6)

Step 1: Access the ff. file **config/environments/production.rb** and uncomment the ff. below:
```ruby
config.force_ssl = true
```

Step 2: Follow Heroku documents for the Production webserver in your **puma.rb**
```ruby
# Puma configuration file.
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") {
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") {
threads min_threads_count, max_threads_count
port
ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { ENV['RACK_ENV']
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid"
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
preload_app!
plugin :tmp_restart
```
_Note: Some of the lines are already in the file, so just uncomment_

Source: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server

Step 3: Replace following line in **config/database.yml** only in the **production** section
```ruby
production:
adapter: postgresql
encoding: unicode
# For details on connection pooling, see Rails configuration guide
# https://guides.rubyonrails.org/configuring.html#database-pooling
pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
database: sample_app_production
username: sample_app
password: <%= ENV['SAMPLE_APP_DATABASE_PASSWORD'] %>
```
_Note: Just change the name of the database and username_ 

---

## **PAGINATION**
Source: https://www.chatwork.com/#!rid68093076-1322031853334429696
(if cannot access this link,
use "The Ruby on Rails tutorial" book by Michael Hartl, sixth edition that covers Rails 6)

Step 1: Insert the pagination gems required
```ruby
gem 'will_paginate'
gem 'will_paginate-bootstrap4'
```
Source for this step: https://stackoverflow.com/questions/45013763/pagination-does-not-work-properly-will-paginate-bootstrap4

Step 2: Install the gems
```ruby
$ bundle install
```

Step 3: Add the special **will_paginate** method in the view of your choice
```javascript
<%= will_paginate %>
```

Step 4: Using the paginate method, we can paginate the users in the sample application by using paginate in place of all in the index action.
Here the page parameter comes from params[:page], which is generated automatically by **will_paginate**.
The ff. below is an example:
```ruby
@users = User.paginate(page: params[:page])
```
---

## **BASIC IMAGE UPLOAD**
Source: https://edgeguides.rubyonrails.org/active_storage_overview.html

_Note: The most convenient way to upload files in Rails is to use a built-in feature
called **Active Storage**. Using Active Storage, an application can transform image uploads with **ImageMagick**, generate image representations of non-image uploads like PDFs and videos, and extract metadata from arbitrary files._


Step 1: Add **Active Storage** by running a single command
```ruby
$ rails active_storage:install
```

Step 2: Setup the Active Storage by migrating your database
```ruby
$ rails db:migrate
```

Step 3: Active Storage API that we need is the **has_one_- attached** method, which allows us to associate an uploaded file with a given model. In our case, we’ll call it image and associate it with the Micropost model.
```ruby
has_one_attached :image
```

Step 4: To include image upload on the Home page, we need to include a **file_field tag** in the micropost form.
```javascript
<span class="image">
    <%= f.file_field :image %>
</span>
```

Step 5: To allow, the upload to go through, we also need to update **micropost_params method**
to add **:image** to the list of attributes permitted to be modified through the web.
```ruby
def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
    else
        @feed_items = current_user.feed.paginate(page: params[:page])
        render 'static_pages/home'
    end
end

private
    def micropost_params
        params.require(:micropost).permit(:content, :image)
    end
```

Step 6: Use of the **attached? boolean** method to prevent displaying an image tag when there isn’t an image. Place this in the file where it displays the contents of the micropost.
```javascript
<span class="content">
    <%= micropost.content %>
    <%= image_tag micropost.image if micropost.image.attached? %>
</span>
```

Step 7: For Image validations, add the ff. gem
```ruby
gem 'active_storage_validations'
```

Step 8: Restart your server

Step 9: Adding these validations to the Micropost model
```ruby
validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                message: "must be a valid image format" },
                size:           { less_than: 5.megabytes,
                                message: "should be less than 5MB" }
```

Step 10: Add the error message and validation for the image upload in _app/views/shared/_micropost_form.html.erb_
```ruby
<script type="text/javascript">
    $("#micropost_image").bind("change", function() {
        const size_in_megabytes = this.files[0].size/1024/1024;
            if (size_in_megabytes > 5) {
            alert("Maximum file size is 5MB. Please choose a smaller file.");
            $("#micropost_image").val("");
        }
    });
</script>
```

Step 11: Replace the old Image file field for this new one in the **_micropost_form.html.erb** file.
This removes or grays out the other files when you are trying to find an image to upload.
```javascript
<span class="image">
    <%# f.file_field :image %>
    <%= f.file_field :image, accept: "image/jpeg,image/gif,image/png" %>
</span>
```

Step 12: Input Imagemagick for resizing images when uploading, so that images that are big will not spread the whole webpage.
```ruby
$ sudo apt-get -y install imagemagick
```

Step 13: Uncomment or add the ff. gems
```ruby
# Image uploading related > Use Active Storage variant
gem 'image_processing', '~> 1.2'
gem 'mini_magick', '4.9.5'
```
_Note: versions may vary, these gem versions were in their latest when this app was still being made_

Step 14: Restart your server

Step 15: Now, it's time to try and resize your images in the Micropost model
```ruby
# Returns a resized image for display.
def display_image
    image.variant(resize_to_limit: [500, 500])
end
```

Step 16: Use the method you made in the Micropost model, and replace the ff. code in the **_micropost.html.erb** file
to the one below
```javascript
<%# image_tag micropost.image if micropost.image.attached? %>
<%= image_tag micropost.display_image if micropost.image.attached? %>
```
---
