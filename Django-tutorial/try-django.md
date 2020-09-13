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
<li><code>python manage.py runserver</code>
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

<pre class=" language-python"><code class="prism  language-python">

INSTALLED_APPS <span class="token operator">=</span> <span class="token punctuation">[</span>
	<span class="token string">'django.contrib.admin'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.auth'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.contenttypes'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.sessions'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.messages'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.staticfiles'</span><span class="token punctuation">,</span>

<span class="token punctuation">]</span>

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
<pre class=" language-python"><code class="prism  language-python">INSTALLED_APPS <span class="token operator">=</span> <span class="token punctuation">[</span>
	<span class="token string">'django.contrib.admin'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.auth'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.contenttypes'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.sessions'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.messages'</span><span class="token punctuation">,</span>
	<span class="token string">'django.contrib.staticfiles'</span><span class="token punctuation">,</span>
	
	<span class="token comment"># own</span>
	<span class="token string">'products'</span><span class="token punctuation">,</span>
<span class="token punctuation">]</span>
</code></pre>
<p>comma(,)에 유의하여 작성한 후 파이썬 스크립트를 모두 저장하고 CMD에서 아래 명령어를 입력한다.</p>
<p><code>python manage.py makemigrations</code>:변화를 생성<br>
<code>python manage.py migrate</code>: 적용<br>
만약 여기까지 수행한 상태에서 다시 models.py를 수정 및 저장하고 <code>python manage.py makemigrations</code>를 시도하면 질문을 받게된다.</p>
<p>파이썬 스크립트 수정 후 반영에 중요하므로, 위 두 줄의 코드는 숙지하도록 하자. 이제 products app(폴더) 내에 <a href="http://admin.py">admin.py</a> 파일을 확인해보자.</p>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">from</span> django<span class="token punctuation">.</span>contrib <span class="token keyword">import</span> admin

<span class="token keyword">from</span> <span class="token punctuation">.</span>models <span class="token keyword">import</span> Product
<span class="token comment"># models.py에서 Product class를 참조한다.</span>
<span class="token comment"># 같은 디렉토리(모듈) 내에 있어서 .으로 처리</span>

admin<span class="token punctuation">.</span>site<span class="token punctuation">.</span>Register<span class="token punctuation">(</span>Product<span class="token punctuation">)</span>
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
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">from</span> django<span class="token punctuation">.</span>db <span class="token keyword">import</span> models

<span class="token keyword">class</span>  <span class="token class-name">Product</span><span class="token punctuation">(</span>models<span class="token punctuation">.</span>Model<span class="token punctuation">)</span><span class="token punctuation">:</span>
	title <span class="token operator">=</span> models<span class="token punctuation">.</span>CharField<span class="token punctuation">(</span>max_length<span class="token operator">=</span><span class="token number">120</span><span class="token punctuation">)</span> <span class="token comment"># max_length : required option in Charfield()</span>
	description <span class="token operator">=</span> models<span class="token punctuation">.</span>TextField<span class="token punctuation">(</span>blank<span class="token operator">=</span><span class="token boolean">True</span><span class="token punctuation">,</span> null<span class="token operator">=</span><span class="token boolean">True</span><span class="token punctuation">)</span>
	price <span class="token operator">=</span> models<span class="token punctuation">.</span>DecimalField<span class="token punctuation">(</span>decimal_places<span class="token operator">=</span><span class="token number">2</span><span class="token punctuation">,</span> max_digits<span class="token operator">=</span><span class="token number">10000</span><span class="token punctuation">)</span>
	summary <span class="token operator">=</span> models<span class="token punctuation">.</span>TextField<span class="token punctuation">(</span><span class="token punctuation">)</span>
</code></pre>
<p>레이아웃이 변경된 것을 확인할 수 있다.<br>
python shell에서 데이터를 추가하는 것 또한 정상적으로 작동하는 것을 확인해볼 수 있다.</p>
<h2 id="change-a-model">Change a Model</h2>
<p>DB의 내용을 지우지 않고, model을 변경하는 방법을 알아보자. migration과 migrate 명령어는 DB와 모델을 연결해준다(sync)</p>
<p>이 때, 기존에 DB에 있는 데이터는 새로 추가될 컬럼(field)에 대한 값을 가지고 있지 않다. 따라서 NULL을 허용하거나, default를 지정하주는 옵션이 필요하다.</p>
<p>기존 4개의 fields에서 "feature"라는 field를 추가하고자 한다. <a href="http://model.py">model.py</a> 파일에 바로 추가 후 migration하면 경고(선택)문구를 확인할 수 있다. 여기서 1번인 "Provide a one-off default now"를 선택하고, default 값을 입력하여 진행할 수 있다. 또한, 추가하는 field 옵션으로 <code>null = True</code>나 <code>default='~~~'</code>를 입력하면 해당 문구는 발생하지 않는다.</p>
<h2 id="default-homepage-to-custom-homepage">Default Homepage to Custom Homepage</h2>
<p>우선 첫 화면을 생성해보자(homepage view)<br>
진행 중인 app 폴더에 <a href="http://view.py">view.py</a> 파일을 확인하고, 아래와 같이 "Hello, World"를 출력하는 HTML 코드를 작성한다.</p>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">from</span> django<span class="token punctuation">.</span>http <span class="token keyword">import</span> HttpResponse
<span class="token keyword">from</span> django<span class="token punctuation">.</span>shortcuts <span class="token keyword">import</span> render

<span class="token comment"># Create your views here.</span>
<span class="token keyword">def</span>  <span class="token function">home_view</span><span class="token punctuation">(</span><span class="token operator">*</span>args<span class="token punctuation">,</span> <span class="token operator">**</span>kwargs<span class="token punctuation">)</span><span class="token punctuation">:</span>
<span class="token keyword">return</span> HttpResponse<span class="token punctuation">(</span><span class="token string">"&lt;h1&gt;Hello World&lt;/h1&gt;"</span><span class="token punctuation">)</span> <span class="token comment"># string of HTML code</span>
</code></pre>
<p>다음으로 프로젝트 폴더의 <a href="http://urls.py">urls.py</a> 파일을 열고, URL주소를 추가한다.</p>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">from</span> django<span class="token punctuation">.</span>contrib <span class="token keyword">import</span> admin
<span class="token keyword">from</span> django<span class="token punctuation">.</span>urls <span class="token keyword">import</span> path

<span class="token keyword">from</span> products <span class="token keyword">import</span> views <span class="token comment"># app 이름 사용</span>

urlpatterns <span class="token operator">=</span> <span class="token punctuation">[</span>
	path<span class="token punctuation">(</span><span class="token string">''</span><span class="token punctuation">,</span> views<span class="token punctuation">.</span>home_view<span class="token punctuation">,</span> name<span class="token operator">=</span><span class="token string">'home'</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
	path<span class="token punctuation">(</span><span class="token string">'admin/'</span><span class="token punctuation">,</span> admin<span class="token punctuation">.</span>site<span class="token punctuation">.</span>urls<span class="token punctuation">)</span><span class="token punctuation">,</span>
<span class="token punctuation">]</span>
</code></pre>
<p>이후 “<a href="http://127.0.0.1:8000/">http://127.0.0.1:8000/</a>” 주소로 진입하면, 처음엔 장고 메인화면이었지만 지금은 바뀐 "Hello World"를 만날 수 있다.</p>
<h2 id="url-routing-and-requests">URL Routing and Requests</h2>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">from</span> django<span class="token punctuation">.</span>http <span class="token keyword">import</span> HttpResponse
<span class="token keyword">from</span> django<span class="token punctuation">.</span>shortcuts <span class="token keyword">import</span> render

<span class="token comment"># Create your views here.</span>
<span class="token keyword">def</span>  <span class="token function">home_view</span><span class="token punctuation">(</span><span class="token operator">*</span>args<span class="token punctuation">,</span> <span class="token operator">**</span>kwargs<span class="token punctuation">)</span><span class="token punctuation">:</span>
	<span class="token keyword">return</span> HttpResponse<span class="token punctuation">(</span><span class="token string">"&lt;h1&gt;Hello World&lt;/h1&gt;"</span><span class="token punctuation">)</span> <span class="token comment"># string of HTML code</span>
<span class="token keyword">def</span>  <span class="token function">contact_view</span><span class="token punctuation">(</span><span class="token operator">*</span>args<span class="token punctuation">,</span> <span class="token operator">**</span>kwargs<span class="token punctuation">)</span><span class="token punctuation">:</span>
	<span class="token keyword">return</span> HttpResponse<span class="token punctuation">(</span><span class="token string">"&lt;h1&gt;Contact Page&lt;/h1&gt;"</span><span class="token punctuation">)</span> <span class="token comment"># string of HTML code</span>
</code></pre>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">from</span> django<span class="token punctuation">.</span>contrib <span class="token keyword">import</span> admin
<span class="token keyword">from</span> django<span class="token punctuation">.</span>urls <span class="token keyword">import</span> path

<span class="token comment"># from products import views</span>
<span class="token keyword">from</span> products<span class="token punctuation">.</span>views <span class="token keyword">import</span> home_view<span class="token punctuation">,</span> contact_view

urlpatterns <span class="token operator">=</span> <span class="token punctuation">[</span>
	path<span class="token punctuation">(</span><span class="token string">''</span><span class="token punctuation">,</span> home_view<span class="token punctuation">,</span> name<span class="token operator">=</span><span class="token string">'home'</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
	path<span class="token punctuation">(</span><span class="token string">'contact/'</span><span class="token punctuation">,</span> contact_view<span class="token punctuation">)</span><span class="token punctuation">,</span>
	path<span class="token punctuation">(</span><span class="token string">'admin/'</span><span class="token punctuation">,</span> admin<span class="token punctuation">.</span>site<span class="token punctuation">.</span>urls<span class="token punctuation">)</span><span class="token punctuation">,</span>
<span class="token punctuation">]</span>
</code></pre>
<p>위처럼 여러 개의 뷰를 생성해서 URL과 매칭할 수 있다.</p>
<h3 id="이용자의-request를-서버에-남기고-추적하기">이용자의 request를 서버에 남기고 추적하기</h3>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">from</span> django<span class="token punctuation">.</span>http <span class="token keyword">import</span> HttpResponse
<span class="token keyword">from</span> django<span class="token punctuation">.</span>shortcuts <span class="token keyword">import</span> render

<span class="token comment"># Create your views here.</span>
<span class="token keyword">def</span>  <span class="token function">home_view</span><span class="token punctuation">(</span>request<span class="token punctuation">,</span> <span class="token operator">*</span>args<span class="token punctuation">,</span> <span class="token operator">**</span>kwargs<span class="token punctuation">)</span><span class="token punctuation">:</span>
	<span class="token keyword">print</span><span class="token punctuation">(</span>args<span class="token punctuation">,</span> kwargs<span class="token punctuation">)</span>
	<span class="token keyword">print</span><span class="token punctuation">(</span>request<span class="token punctuation">.</span>user<span class="token punctuation">)</span>
	<span class="token keyword">return</span> HttpResponse<span class="token punctuation">(</span><span class="token string">"&lt;h1&gt;Hello World&lt;/h1&gt;"</span><span class="token punctuation">)</span> <span class="token comment"># string of HTML code</span>
</code></pre>
<p>현재 작업 중이 관리자 계정으로 웹페이지 방문 시, 관리자 이름을 확인할 수 있고, 로그인되지 않은 유저의 방문시 AnonymousUser 임을 확인할 수 있다.</p>
<h2 id="django-templates">Django Templates</h2>
<p>먼저 현재 Django Project가 진행 중인 src 폴더 안에 template이라는 폴더를 생성한다. 그 후 폴더 안에 “home.html” 파일을 생성 후 아래와 같이 작성한다.</p>
<pre class=" language-html"><code class="prism  language-html"><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>Hello world<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>This is a Template<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<p><a href="http://views.py">views.py</a> 파일에 아래와 같이 페이지(함수)를 추가한다.</p>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">def</span>  <span class="token function">home_view</span><span class="token punctuation">(</span>request<span class="token punctuation">,</span> <span class="token operator">*</span>args<span class="token punctuation">,</span> <span class="token operator">**</span>kwargs<span class="token punctuation">)</span><span class="token punctuation">:</span>
	<span class="token keyword">print</span><span class="token punctuation">(</span>args<span class="token punctuation">,</span> kwargs<span class="token punctuation">)</span>
	<span class="token keyword">print</span><span class="token punctuation">(</span>request<span class="token punctuation">.</span>user<span class="token punctuation">)</span>
	<span class="token keyword">return</span> render<span class="token punctuation">(</span>request<span class="token punctuation">,</span> <span class="token string">"home.html"</span><span class="token punctuation">,</span> <span class="token punctuation">{</span><span class="token punctuation">}</span><span class="token punctuation">)</span> <span class="token comment"># HTML template 사용</span>
</code></pre>
<p><a href="http://settings.py">settings.py</a> 에서 아래 부분을 확인한다.</p>
<pre class=" language-python"><code class="prism  language-python">TEMPLATES <span class="token operator">=</span> <span class="token punctuation">[</span>
	<span class="token punctuation">{</span>
		<span class="token string">'BACKEND'</span><span class="token punctuation">:</span> <span class="token string">'django.template.backends.django.DjangoTemplates'</span><span class="token punctuation">,</span>
<span class="token comment">#		'DIRS': ['/you/path/to/templates'],</span>
<span class="token string">'DIRS'</span><span class="token punctuation">:</span> <span class="token punctuation">[</span>os<span class="token punctuation">.</span>path<span class="token punctuation">.</span>join<span class="token punctuation">(</span>BASE_DIR<span class="token punctuation">,</span><span class="token string">"template"</span><span class="token punctuation">)</span><span class="token punctuation">]</span><span class="token punctuation">,</span> <span class="token comment"># 하드코딩 말고 기존경로 반영</span>
		<span class="token string">'APP_DIRS'</span><span class="token punctuation">:</span> <span class="token boolean">True</span><span class="token punctuation">,</span>
		<span class="token string">'OPTIONS'</span><span class="token punctuation">:</span> <span class="token punctuation">{</span>
			<span class="token string">'context_processors'</span><span class="token punctuation">:</span> <span class="token punctuation">[</span>
				<span class="token string">'django.template.context_processors.debug'</span><span class="token punctuation">,</span>
				<span class="token string">'django.template.context_processors.request'</span><span class="token punctuation">,</span>
				<span class="token string">'django.contrib.auth.context_processors.auth'</span><span class="token punctuation">,</span>
				<span class="token string">'django.contrib.messages.context_processors.messages'</span><span class="token punctuation">,</span>
			<span class="token punctuation">]</span><span class="token punctuation">,</span>
		<span class="token punctuation">}</span><span class="token punctuation">,</span>
	<span class="token punctuation">}</span><span class="token punctuation">,</span>
<span class="token punctuation">]</span>
</code></pre>
<p>새로 추가하는 항목들에 대해서 <a href="http://urls.py">urls.py</a>, <a href="http://views.py">views.py</a>, template~~.html 파일을 잘 추가해서 관리해주면 된다.</p>
<h2 id="django-templating-engine">Django Templating Engine</h2>
<p><strong>웹페이지에서 사용자 이름을 출력</strong><br>
{{ }} 안에 request.user을 입력하면 된다. home.html 파일을 아래와 같이 수정 및 저장한다.</p>
<pre class=" language-html"><code class="prism  language-html"><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>Hello world<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>
{{ request.user }}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>This is a Template<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<p><strong>로그인여부확인</strong><br>
로그인 여부를 True/False로 출력</p>
<pre class=" language-html"><code class="prism  language-html"><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>Hello world<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>
{{ request.user.is_authenticated }}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>This is a Template<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<p><strong>base template 활용하기</strong></p>
<ol>
<li>base.html 파일 생성</li>
</ol>
<pre class=" language-html"><code class="prism  language-html"><span class="token doctype">&lt;!doctype  html&gt;</span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>html</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>head</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>title</span><span class="token punctuation">&gt;</span></span>Coding for Entrepreneurs is doing Try Django<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>title</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>head</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>body</span><span class="token punctuation">&gt;</span></span>
	{% block content %}
	replace me
	{% endblock %}
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>body</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>html</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<ol start="2">
<li>home.html 내용 수정</li>
</ol>
<pre class=" language-html"><code class="prism  language-html">{% extends 'base.html' %}

{% block content %}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>Hello world<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>This is a Template<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>
{% endblock %}
</code></pre>
<p>base.html에서 설정해준 <code>&lt;title&gt; &lt;/title&gt;</code>에 따라 웹페이지 실행 시에 상단 탭에 들어가는 이름이 바뀌었음을 확인할 수 있다.</p>
<ol start="3">
<li>about.html 내용 수정</li>
</ol>
<pre class=" language-html"><code class="prism  language-html">{% extends "base.html" %}

<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>About<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>This is a Template<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<p>본문이 replace me로 바뀐 것을 확인할 수 있다.</p>
<p>이런 식으로 여러 개의 html 파일(화면)을 일관성있게 관리할 수 있다.</p>
<pre class=" language-html"><code class="prism  language-html"><span class="token doctype">&lt;!doctype  html&gt;</span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>html</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>head</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>title</span><span class="token punctuation">&gt;</span></span>Coding for Entrepreneurs is doing Try Django<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>title</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>head</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>body</span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>This is a navbar<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>
	
	{% block content %}
	replace me
	{% endblock %}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>body</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>html</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<p><code>&lt;h1&gt;</code> 태그로 "This is a navbar"라는 문구를 여러 html에 동시에 추가해 넣을 수 있다.</p>
<h2 id="include-template-tag">Include Template Tag</h2>
<p>navbar.html 파일을 생성하고 아래와 같이 입력한 다음 base.html 파일의 코드를 수정한다.</p>
<pre class=" language-html"><code class="prism  language-html"><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>nav</span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>ul</span><span class="token punctuation">&gt;</span></span>
		<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span>Brand<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
		<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span>Contact<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
		<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span>About<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>ul</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>nav</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<pre class=" language-html"><code class="prism  language-html"><span class="token doctype">&lt;!doctype  html&gt;</span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>html</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>head</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>title</span><span class="token punctuation">&gt;</span></span>Coding for Entrepreneurs is doing Try Django<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>title</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>head</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>body</span><span class="token punctuation">&gt;</span></span>
	{% include 'navbar.html' %}

	{% block content %}
	  replace me
	{% endblock %}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>body</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>html</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<p>일관되게 navbar가 추가된 것을 확인할 수 있다.</p>
<h2 id="rendering-context-in-a-template">Rendering Context in a Template</h2>
<p>웹페이지를 꾸미는 것도 좋지만, 우리가 다루고자 하는 것은 데이터를 다루는 백엔드 영역이다.</p>
<p>Django는 template과 template context를 결합해 regular html로 render한다. 그로 인해 유저는 이 화면을 볼 수 있는 것이다. Context는 any data type을 의미한다.</p>
<p><a href="http://views.py">views.py</a> 파일을 살펴보자. 이 때 파이썬의 (key, value) 형태인 dictionary를 활용한다.</p>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">def</span>  <span class="token function">about_view</span><span class="token punctuation">(</span>request<span class="token punctuation">,</span> <span class="token operator">*</span>args<span class="token punctuation">,</span> <span class="token operator">**</span>kwargs<span class="token punctuation">)</span><span class="token punctuation">:</span>
	my_context <span class="token operator">=</span> <span class="token punctuation">{</span>
		<span class="token string">"my_text"</span><span class="token punctuation">:</span> <span class="token string">"This is about us"</span><span class="token punctuation">,</span>
		<span class="token string">"my_number"</span><span class="token punctuation">:</span> <span class="token number">123</span><span class="token punctuation">,</span>
		<span class="token string">"my_list"</span><span class="token punctuation">:</span> <span class="token punctuation">[</span><span class="token number">123</span><span class="token punctuation">,</span><span class="token number">4242</span><span class="token punctuation">,</span><span class="token number">123123</span><span class="token punctuation">]</span>
		<span class="token punctuation">}</span>
	<span class="token keyword">return</span> render<span class="token punctuation">(</span>request<span class="token punctuation">,</span> <span class="token string">"about.html"</span><span class="token punctuation">,</span> my_context<span class="token punctuation">)</span> <span class="token comment"># HTML template 사용</span>
</code></pre>
<p>이제 about.html 파일을 일부 수정하자.</p>
<pre class=" language-html"><code class="prism  language-html">{% extends "base.html" %}

{% block content %}
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>About<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>This is a Template<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>

	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>
		{{ my_text }}, {{ my_number }}, {{ my_list }}
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>

{% endblock content %}
</code></pre>
<p>위에서 입력한 (key,value) 타입의 데이터를 웹 페이지에서 확인 가능하다.</p>
<h2 id="for-loop-in-a-template">For Loop in a Template</h2>
<p>템플릿 내에서 Loop를 수행해보자.</p>
<p>about.html과 <a href="http://views.py">views.py</a> 두 파일을 아래와 같이 수정하면 Loop에 따라 웹페이지의 문구가 작성된 것을 확인할 수 있다.</p>
<p>하지만 이것 또한 하드 코딩이기 때문에 좀 더 합리적인 방법이 필요해보인다.</p>
<pre class=" language-html"><code class="prism  language-html">{% extends "base.html" %}

{% block content %}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>About<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>This is a Template<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>

<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>
	{{ my_text }}, {{ my_number }}, {{ my_list }}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>

<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>ul</span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span>Item 1<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span>Item 2<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>ul</span><span class="token punctuation">&gt;</span></span>

<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>ul</span><span class="token punctuation">&gt;</span></span>
	{% for my_sub_item in my_list %}
		<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span> {{ forloop.counter }} - {{my_sub_item}} <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span> 
	{% endfor %}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>ul</span><span class="token punctuation">&gt;</span></span>

{% endblock content %}
</code></pre>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">def</span>  <span class="token function">about_view</span><span class="token punctuation">(</span>request<span class="token punctuation">,</span> <span class="token operator">*</span>args<span class="token punctuation">,</span> <span class="token operator">**</span>kwargs<span class="token punctuation">)</span><span class="token punctuation">:</span>
	my_context <span class="token operator">=</span> <span class="token punctuation">{</span>
		<span class="token string">"my_text"</span><span class="token punctuation">:</span> <span class="token string">"This is about us"</span><span class="token punctuation">,</span>
		<span class="token string">"my_number"</span><span class="token punctuation">:</span> <span class="token number">123</span><span class="token punctuation">,</span>
		<span class="token string">"my_list"</span><span class="token punctuation">:</span> <span class="token punctuation">[</span><span class="token number">1313</span><span class="token punctuation">,</span><span class="token number">4242</span><span class="token punctuation">,</span><span class="token number">312</span><span class="token punctuation">,</span><span class="token string">"Abc"</span><span class="token punctuation">]</span>
	<span class="token punctuation">}</span>

<span class="token keyword">for</span> item <span class="token keyword">in</span> <span class="token punctuation">[</span><span class="token number">123</span><span class="token punctuation">,</span><span class="token number">12331</span><span class="token punctuation">,</span> <span class="token number">1233</span><span class="token punctuation">]</span><span class="token punctuation">:</span>
	my_context<span class="token punctuation">[</span><span class="token string">'item1'</span><span class="token punctuation">]</span> <span class="token operator">=</span> item

<span class="token keyword">return</span> render<span class="token punctuation">(</span>request<span class="token punctuation">,</span> <span class="token string">"about.html"</span><span class="token punctuation">,</span> my_context<span class="token punctuation">)</span> <span class="token comment"># HTML template 사용</span>
</code></pre>
<h2 id="using-conditions-in-a-template">Using Conditions in a Template</h2>
<p>if-else의 조건문을 템플릿에서 사용할 수 있다.<br>
위에서와 동일하게 about.html, <a href="http://views.py">views.py</a> 파일을 수정하면 웹 페이지에 변화사항을 확인할 수 있다.</p>
<pre class=" language-html"><code class="prism  language-html">{% extends "base.html" %}

{% block content %}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>h1</span><span class="token punctuation">&gt;</span></span>About<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>h1</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>This is a Template<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>

<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>p</span><span class="token punctuation">&gt;</span></span>
	{{ my_text }}, {{ my_number }}, {{ my_list }}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>p</span><span class="token punctuation">&gt;</span></span>

<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>ul</span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span>Item 1<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
	<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span>Item 2<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>ul</span><span class="token punctuation">&gt;</span></span>

<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>ul</span><span class="token punctuation">&gt;</span></span>
	{% for abc in my_list %}
		{% if abc == 312 %}
			<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span> {{ forloop.counter }} - {{ abc|add:22 }} <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
		{% elif abc == "Abc" %}
			<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span> This is not the network <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
		{% else %}
			<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>li</span><span class="token punctuation">&gt;</span></span> {{ forloop.counter }} - {{ abc }} <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>li</span><span class="token punctuation">&gt;</span></span>
		{% endif %}
	{% endfor %}
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>ul</span><span class="token punctuation">&gt;</span></span>

{% endblock content %}
</code></pre>
<pre class=" language-python"><code class="prism  language-python"><span class="token keyword">def</span>  <span class="token function">about_view</span><span class="token punctuation">(</span>request<span class="token punctuation">,</span> <span class="token operator">*</span>args<span class="token punctuation">,</span> <span class="token operator">**</span>kwargs<span class="token punctuation">)</span><span class="token punctuation">:</span>
	my_context <span class="token operator">=</span> <span class="token punctuation">{</span>
	<span class="token string">"my_text"</span><span class="token punctuation">:</span> <span class="token string">"This is about us"</span><span class="token punctuation">,</span>
	<span class="token string">"this_is_true"</span><span class="token punctuation">:</span> <span class="token boolean">True</span><span class="token punctuation">,</span>
	<span class="token string">"my_number"</span><span class="token punctuation">:</span> <span class="token number">123</span><span class="token punctuation">,</span>
	<span class="token string">"my_list"</span><span class="token punctuation">:</span> <span class="token punctuation">[</span><span class="token number">1313</span><span class="token punctuation">,</span><span class="token number">4242</span><span class="token punctuation">,</span><span class="token number">312</span><span class="token punctuation">,</span><span class="token string">"Abc"</span><span class="token punctuation">]</span>
	<span class="token punctuation">}</span>
	<span class="token keyword">for</span> item <span class="token keyword">in</span> <span class="token punctuation">[</span><span class="token number">123</span><span class="token punctuation">,</span><span class="token number">12331</span><span class="token punctuation">,</span> <span class="token number">1233</span><span class="token punctuation">]</span><span class="token punctuation">:</span>
		my_context<span class="token punctuation">[</span><span class="token string">'item1'</span><span class="token punctuation">]</span> <span class="token operator">=</span> item
	<span class="token keyword">return</span> render<span class="token punctuation">(</span>request<span class="token punctuation">,</span> <span class="token string">"about.html"</span><span class="token punctuation">,</span> my_context<span class="token punctuation">)</span> <span class="token comment"># HTML template 사용</span>
</code></pre>


