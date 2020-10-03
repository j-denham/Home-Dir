## Misc Terminal Commands

### Virtual Env
  * $ python3 -m venv venv -> Initialises a virtual env { Linux }
  * $ source venv/bin/activate -> Enters the virtual env { Linux }
  * CTRL-D exits the virtual env
  * $ pipenv shell -> Enters the virtual environment { Windows }

### Installations
  * $ pip install <package_name> -> Installs the specified package. Make sure you're in your virtual env to avoid a global install
  * $ pip freeze > requirements.txt -> Writes the currently install packages so to requirments so that they can be installed later
  * $ pip install -r requirements.txt -> Installs all packages specified in requirements.txt

### Django
  * $ python manage.py runserver -> Starts the server, granted django has been initialised for the project
  * $ python manage.py createsuperuser -> Creates an admin user for this project
  * $ python manage.py startapp <app-name> -> Generates a django app in your project folder. Whenever a new app is created, add it to INSTALLED\_APPS in settings.py

### Migrations
  * $ python manage.py makemigrations <app-name> -> Generate migrations folder for an app
  * $ python manage.py migrate -> Runs all migrations
  * Migrations pertain to models and are required to set-up the database {TODO: Research this further}

### Django Shell
  * $ python manage.py shell -> Enters an interactive shell for the Django project, make sure to be in virtual environment
  * Inspecting a ModelSerializer:
    * `$ from <app-name>.serializers import <SerializerClass>`
    * `$ serializer = <SerializerClass>()`
    * `$ print(repr(serializer))`
  * $ exit() -> Exits the shell


## Django Project Concepts & Config

Applications:
* A Django project can have many applications. Each appliation ideally should do one thing
* Django applications are modular and reusable, if another package needs the same app over and over we can put that app in the Python package manager and install it
from there

MVT (Model View Template) Framework:
* Django has no controller, and uses frameworks instead. For MVC architecture notes look in webdev
* There are many types of views in Django: Function views, class based views, generic API views etc.  
* There are many default generic views that are useful. Functions views are nice only if the time customizing a generic view is more than the time required to write it by hand. {TODO: Research this further and find a design paradigm which you like}

## Django Built-in Features

Models:
* a model is an object representing your table's data
* A Django model may have one or more fields. Each field is a column in your table
* Take time to check the Django fields documentation. When planning a model try to choose the most appropriate fields for your use case. 
* ID fields are generated automatically and thus can be used for foreign keys in other schema
* Foreign key fields within a model class can be defined with `models.ForeignKey(<FK-Model>, on_delete=models.CASCADE)`
* One to one relationships can be defined with `models.OneToOneField(<Relation-Model>, on_delete=models.CASCADE, primary_key=True)`
* One to many relationships can be defined similarly to the above. Consult the docs because this is a bit more complicated

Serializers
* Django models are a Python class, therefore the data should be serialized to JSON before being passed to the front-end
* It goes the other way too, JSON objects should be serialized to a Python object when making a CRUD request to the API

Views
* Handles different HTTP requests and specifies the logic regarding the querying of the model corresponding to the request
* Class Based/Generic Views:
  * Because Django's URL resolver expects to send the request and associated arguments to a callable function, class-based views should be given in urls.py with            MyView.as\_view(). This function creates an instance of the class, calls setup() to initiase its attributes, and then calls dispatch() which looks at the request to    determine whether it is GET, POST etc.
  * Mixins:
    * Mixins are a form of multiple inheritance where behaviours and attributes of multiple parent classes can be combined. Mixins are an excellent way of reusing code       across multiple classes, but they come with some cost. The more your code is scattered among mixins, the harder it will be to read a child class and know exactly       what it is doing, and thus which methods from which mixins to override if you are subclassing something that has a deep inheritance tree
    * NB: You can only inherit form one generic view. That is, only one parenty class may inherit from View, and the rest should be mixins. Trying to inherit from more       than one class that inherits from View won't work as expected 
  * Decorating Class Based Views:
    * To decorate every instance of a class based view, you need to decorate the class definition itself. To do this you appy the decorator to the dispatch() method of       the class. For example:
      ```
      @method_decorator(login_required)
      def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)
      ```
      OR
      ```
      @method_decorator(login_required, name='dispatch')
      class ProtectedView(TemplateView):
      ...Rest of the code...
      ```
    * Keep in mind, multiple decorators can be added
    * If you only want to decorate the a signle result, and not the whole class itself, you can instead decorate this at the URL config

## Guidelines for Testing

There's no point in testing a vanilla Django model nor the Django ORM. Don't test
  * Django built-in code
  * Python built in functions

What you should test:
* Added a custom method to a Django model? Test it
* Added a custom view? Test it

Using coverage for testing {NOTE: Haven't tried this yet}:
* $ pip install coverage
* Every time you add code to your application run $ coverage run --source='.' manage.py test
* Generate a report {$ coverage html} as a webpage or on the command line with {$ coverage report}
