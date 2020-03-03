---


---

<h1 id="try-django">Try-Django</h1>
<p>QR시스템은 기본적으로 파이썬을 활용할 것이므로 가급적 빠르게 적용할 수 있는 Django를 익히고자 함.</p>
<h2 id="environment-settings">Environment settings</h2>
<ol>
<li>cmd환경에서 working directory 생성
<ul>
<li><code>mkdir "dir-name"</code></li>
<li><code>cd "dir-name"</code></li>
</ul>
</li>
<li>가상환경 생성 및 진입 :  <code>virtualenv</code><br>
a) <code>virtualenv -p python3 .</code> : 디렉토리 내 가상환경에 파이썬 환경 설정<br>
- 가상환경 activate이 제대로 되지 않음.<br>
b) <code>python -m venv "venv-name"</code><br>
- <code>venv-name\scripts\activate</code> 로 가상환경 진입 ( / 아니고 \ 임에 유의)<br>
* 출처 : <a href="https://hongku.tistory.com/258">https://hongku.tistory.com/258</a></li>
<li>장고설치 : <code>pip install django==2.0.7</code>
<ul>
<li>장고는 튜토리얼을 위해 2.0.7 버전으로 설치
<ul>
<li><a href="https://www.youtube.com/watch?v=F5mRW0jo-U4">https://www.youtube.com/watch?v=F5mRW0jo-U4</a></li>
</ul>
</li>
</ul>
</li>
</ol>
<h2 id="creating-a-black-django-project">Creating a black Django Project</h2>
<ol>
<li><code>django-admin</code> : 장고 어드민의 커맨드 확인</li>
<li><code>mkdir src</code> : src 폴더 생성 (source의 약자)</li>
<li><code>django-admin startproject "trydjango ."</code> : src 폴더 진입 후 프로젝트 생성</li>
<li><code>python mange.py runserver</code>
<ul>
<li>실행 후 서버가 시작되었다는 문구와 함께 url을 확인할 수 있다. “<a href="http://127.0.0.1:8000/">http://127.0.0.1:8000/</a>”
<ul>
<li>이 주소를 따라서 들어가면 환영해주는 장고 웹페이지를 확인할 수 있다.</li>
</ul>
</li>
</ul>
</li>
</ol>
<h2 id="setup-your-code-text-editor">Setup Your Code Text Editor</h2>
<p>텍스트 에디터로서 Sublime Text 또는 Pycharm을 권장함.<br>
sublime Text 3 다운로드에 지장이 있어 우선 VScode를 사용하기로 함.</p>
<h2 id="settings">Settings</h2>
<ol>
<li>VScode에서 폴더 불러오기
<ul>
<li>폴더 불러오기</li>
<li>워크스페이스 설정하기(다른이름으로 저장)</li>
<li>…/trydjango/src/trydjango/setting.py 파일의 코드를 확인
<ol>
<li>경로지정 : BASE_DIR 부분 확인</li>
<li>SECRET_KEY</li>
<li>DEBUG = True : 학습 및 자체 구현 시에는 True로 두고, 실제 운영 시에는 False로 해야한다고 함.</li>
<li>ALLOWED_HOSTS = [] : 나중에 다시 확인</li>
<li>INSTALLED_APPS = […] : 더 큰 장고프로젝트를 위한 조각…?</li>
<li>MIDDLEWARE  = [ ] : advanced topic</li>
<li>ROOT_URLCONF = ‘trydajngo.url’ : URL 지정</li>
<li>TEMPLATES = […] : rendering ?</li>
<li>WSGI_APPLICATION</li>
<li>DATABASES = {…} :  디폴트로 sqlite3가 지정되어있음.<br>
등 여러가지 설정 옵션들을 가지고 있음.</li>
</ol>
</li>
</ul>
</li>
</ol>
<h2 id="bulit-in-components">Bulit-in Components</h2>
<p>위 단계에서 보았던 <a href="http://settings.py">settings.py</a> 파일의 INSTALLED_APPS 부분에 해당한다.</p>
<pre><code>INSTALLED_APPS = [
	'django.contrib.admin',
	'django.contrib.auth',
	'django.contrib.contenttypes',
	'django.contrib.sessions',
	'django.contrib.messages',
	'django.contrib.staticfiles',

]
</code></pre>
<p>예를들어 <code>'django.contrib.admin'</code> 이 app을 사용해서 <code>127.0.1:8000/admin/</code> 장고 관리자 페이지를 사용할 수 있다.</p>
<h3 id="cmd---migrate">cmd - migrate</h3>
<p>migration 관련 명령어들은 models.py에 정의된 모델의 생성/변경내역을 히스토리관리, DB에 적용 등과 같은 기능을 제공하여 손쉽게 DB구조를 관리할 수 있게 해준다. (출처 : <a href="https://brownbears.tistory.com/443">https://brownbears.tistory.com/443</a>)</p>
<p><code>python manage.py migrate</code> : 마이그레이션 적용</p>
<ul>
<li>적용되지 않은 생성/변경된 migrations들의 파일을 DB에 적용</li>
</ul>
<p><code>python manage.py createsuperuser</code> : 관리자계정 생성하기</p>
<ul>
<li>생성 후 admin 페이지에서 로그인 가능<br>
추가적인 personal info를 작성할 수 있다.</li>
<li><code>'django.contrib.auth'</code> : user를 생성하는 것은 이 app과 관련있다.</li>
</ul>
<h2 id="your-first-app-component">Your First App Component</h2>
<p>미리 구성되어있는(bulit-in) Django app을 사용하는 것도 좋지만, 본래의 목적은 스스로 Django app component를 만들고 활용하는 것이다.</p>
<p>Django Project의 root 폴더에서 <code>manage.py</code> 파일을 확인할 수 있다.</p>
<p><code>python manage.py startapp products</code> : 앱성성</p>
<ul>
<li>커맨드를 작성하면 Django Project가 있는 폴더에 products라는 이름의 폴더가 생성된다.</li>
</ul>
<p>아래와 같이 이름을 달리한 여러 app을 생성할 수 있다.(이는 모두 e-commerce project에서 사용되는 app names라고 한다.)<br>
<code>python manage.py startapp blog</code><br>
<code>python manage.py startapp profiles</code><br>
<code>python manage.py startapp cart</code></p>
<p>product 폴더에 <a href="http://models.py">models.py</a> 파일을 열어보자.<br>
product를 저장하고, back-end에서 내가 만들어낸 product를 기억하게 만들고 싶다.</p>
<p>product class에 title, description, price를 정의하고 이를 DB에 매핑하고자 한다.</p>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">from</span> django<span class="token punctuation">.</span>db <span class="token keyword">import</span> models

<span class="token comment"># Create your models here.</span>
<span class="token keyword">class</span>  <span class="token class-name">Product</span><span class="token punctuation">(</span>models<span class="token punctuation">.</span>Model<span class="token punctuation">)</span><span class="token punctuation">:</span>
	title      <span class="token operator">=</span> models<span class="token punctuation">.</span>TextField<span class="token punctuation">(</span><span class="token punctuation">)</span>
	decription <span class="token operator">=</span> models<span class="token punctuation">.</span>TextField<span class="token punctuation">(</span><span class="token punctuation">)</span>
	price      <span class="token operator">=</span> models<span class="token punctuation">.</span>TextField<span class="token punctuation">(</span><span class="token punctuation">)</span>
</code></pre>
<p>이후 <a href="http://settings.py">settings.py</a> 파일에서 INSTALLED_APPS 부분에 생성한 app을 추가해준다.</p>
<pre><code>INSTALLED_APPS = [
	'django.contrib.admin',
	'django.contrib.auth',
	'django.contrib.contenttypes',
	'django.contrib.sessions',
	'django.contrib.messages',
	'django.contrib.staticfiles',
	
	# own
	'products',
]
</code></pre>
<p>comma(,)에 유의하여 작성한 후 파이썬 스크립트를 모두 저장하고 CMD에서 아래 명령어를 입력한다.</p>
<p><code>python manage.py makemigrations</code>:변화를 생성<br>
<code>python manage.py migrate</code>: 적용<br>
만약 여기까지 수행한 상태에서 다시 models.py를 수정 및 저장하고 <code>python manage.py makemigrations</code>를 시도하면 질문을 받게된다.</p>
<p>파이썬 스크립트 수정 후 반영에 중요하므로, 위 두 줄의 코드는 숙지하도록 하자. 이제 products app(폴더) 내에 <a href="http://admin.py">admin.py</a> 파일을 확인해보자.</p>
<pre><code>from django.contrib import admin

from .models import Product
# models.py에서 Product class를 참조한다.
# 같은 디렉토리(모듈) 내에 있어서 .으로 처리

admin.site.Register(Product)
</code></pre>
<p>관리자 웹(Django Administration)을 확인하면 Products가 생성된 것을 확인할 수 있다. 여기서 product로 진입 후, 우측 상단의 add 버튼을 눌러보자.<br>
위의 코드에서 지정해둔 대로 Title, Description, Price, Summary 4개의 값을 입력받을 수 있고, Summary의 경우 미리 입력한 default ‘This is cool!’ 문구를 확인할 수 있다.</p>
<p>여기에 값을 입력 후, 우측 하단에 Save 버튼을 누르면 DB에 저장된다.</p>
<h2 id="create-product-objects-in-the-python-shell">Create Product Objects in the Python Shell</h2>
<p>이제 Python shell에서 새로운 Products를 생성해보자. 아래의 코드를 입력한다.</p>
<p><code>python manage.py shell</code> : 모든 Django Project Stuff가 Python Interpreter 안에서 작동한다.</p>
<ul>
<li><code>quit()</code> 명령어를 통해 python shell에서 나올 수 있다.<br>
인터프리터에 진입 후 아래의 코드 입력<br>
<code>from products.models import Product</code><br>
<code>Product.objects.all()</code> : (Django command) 전체 objects의 개수를 확인<br>
<code>Product.objects.create()</code> : 위에서 4개의 인자를 정의했으므로 4개의 값을 입력해준다.</li>
</ul>
<p>호스팅 된 웹서버에서 입력된 값을 확인할 수 있다.</p>
<h2 id="new-model-fields">New Model Fields</h2>
<p><code>https://docs.djangoproject.com/en/3.0/ref/models/fields/#field-types</code> : 장고에서 사용되는 데이터 타입 참고가능</p>
<p>여러가지 형태로 field를 수정해보자.</p>
<pre><code>from django.db import models

class  Product(models.Model):
	title = models.CharField(max_length=120) # max_length : required option in Charfield()
	description = models.TextField(blank=True, null=True)
	price = models.DecimalField(decimal_places=2, max_digits=10000)
	summary = models.TextField()
</code></pre>
<p>레이아웃이 변경된 것을 확인할 수 있다.<br>
python shell에서 데이터를 추가하는 것 또한 정상적으로 작동하는 것을 확인해볼 수 있다.</p>
<h2 id="change-a-model">Change a Model</h2>
<p>DB의 내용을 지우지 않고, model을 변경하는 방법을 알아보자. migration과 migrate 명령어는 DB와 모델을 연결해준다(sync)</p>
<p>이 때, 기존에 DB에 있는 데이터는 새로 추가될 컬럼(field)에 대한 값을 가지고 있지 않다. 따라서 NULL을 허용하거나, default를 지정하주는 옵션이 필요하다.</p>
<p>기존 4개의 fields에서 "feature"라는 field를 추가하고자 한다. <a href="http://model.py">model.py</a> 파일에 바로 추가 후 migration하면 경고(선택)문구를 확인할 수 있다. 여기서 1번인 "Provide a one-off default now"를 선택하고, default 값을 입력하여 진행할 수 있다. 또한, 추가하는 field 옵션으로 <code>null = True</code>나 <code>default='~~~'</code>를 입력하면 해당 문구는 발생하지 않는다.</p>
<h2 id="default-homepage-to-custom-homepage">Default Homepage to Custom Homepage</h2>
<p>(59:28~) <a href="https://www.youtube.com/watch?v=F5mRW0jo-U4">https://www.youtube.com/watch?v=F5mRW0jo-U4</a></p>

