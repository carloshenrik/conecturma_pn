%include('gestao_aprendizagem/header/header.tpl', title="Gestão Aprendizagem", css="css-listagem-escolas.css") 
%include('gestao_aprendizagem/menu/menu.tpl')
<div class="col-md-9 order-md-3 botao-tabela" style="margin-top: 6px;">
  <div class="container">
    <div class="row">
      <div class=" col-md-5">
        <p class="top-escolas-tabela">Usuários</p>
        %include('gestao_aprendizagem/usuario/selecao_novo_usuario.tpl')
      </div>
      <div class="col-md-4 offset-md-5">

          <div class="input-group pesquisa">
            <!--pesquisa-->
            <!--<input class="form-control pesquisa-input" type="text" placeholder="Pesquisar" aria-label="Search" style="padding-left: 20px; border-radius: 40px;background-color: #dedede;height: 30px;z-index: -1" id="mysearch">
            <div class="input-group-addon" style="margin-left: -26px;border-radius: 40px; background-color: #f3f3f3; border:none;">
              <button type="submit" style="border-radius: 20px;border:1px transparent;height: 30px;" id="search-btn">
                <i class="fa fa-search"></i>
              </button>
              <!--pesquisa-->
            </div>

      </div>

      </div>
      <!--fim da div de pesquisa-->
    </div>
    <!--fim da row do conteudo acima da tabela -->
    <br/>
    <br/>
    %if tipo == '3':
        <div id="4" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_aluno.tpl')
        </div>
    %elif tipo == '0':
        <div id="1" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_gestor.tpl')
        </div>
         <div id="2" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_diretor.tpl')
        </div>
       <div id="3" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_professor.tpl')
        </div>
       <div id="4" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_aluno.tpl')
        </div>
    %elif tipo == '1':
         <div id="2" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_diretor.tpl')
        </div>
       <div id="3" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_professor.tpl')
        </div>
       <div id="4" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_aluno.tpl')
        </div>
    %elif tipo == '2':
       <div id="3" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_professor.tpl')
        </div>
       <div id="4" style="display:none;">
          %include('gestao_aprendizagem/usuario/formulario_cadastro_nova_usuario_aluno.tpl')
        </div>
    % end


    <div id="accordion">
      <!-- inicio da tabela -->
      <div class="row">
          <div class="col-md-4 item-tabela topo-tab">
            Nome
          </div>

          <div class="col-md-3 item-tabela topo-tab">
            Email
          </div>

          <div class="col-md-2 item-tabela topo-tab">
            Escola
          </div>

          <div class="col-md-2 item-tabela topo-tab">
            Tipo
          </div>

          <div class="col-md-1 item-tabela topo-tab">
          </div>
      </div>
        <%
            for index,i in enumerate(usuarios):
        %>
           %include('gestao_aprendizagem/usuario/usuario_template_edicao.tpl')
        <%
            end
        %>

      <!-- bloco de cabeçalho da lista -->
  </div>
</div>
</div>
<script type="text/javascript" src="/static/js/jquery-3.3.1-min.js"></script>
<script>


$(document).ready(function(){
    $("button#dads").click(function(){
        $("div#novo-gestor").toggle(100);
    });
});

$(document).ready(function(){
    $("button#prof").click(function(){
        $("div#novo-professor").toggle(100);
    });
});

$(document).ready(function(){
    $("button#diretor").click(function(){
        $("div#novo-diretor").toggle(100);
    });
});

$(document).ready(function(){
    $("button#aluno").click(function(){
        $("div#novo-aluno").toggle(100);
    });
});



</script>
<script type="text/javascript">



  function test(ide) {-->
    <!--console.log(ide);-->
    <!--y = document.getElementById(ide).innerHTML;-->
    <!--x = document.getElementById("nova-escola").style.display;-->
    <!--prof = document.getElementById("novo-prof").style.display;-->
    <!--diretor = document.getElementById("novo-diretor");-->
    <!--gestor = document.getElementById("novo-gestor");-->
    <!--aluno = document.getElementById("novo-aluno");-->
    <!--console.log(x, y)-->
    <!--if (prof == "none") {-->
      <!--document.getElementById("novo-prof").style.display = 'block';-->
      <!--document.getElementById(ide).innerHTML = '<i id="setinha" class="fas fa-angle-up"></i>';-->
    <!--}-->
    <!--else {-->
      <!--document.getElementById("nova-escola").style.display = 'none';-->
      <!--document.getElementById(ide).innerHTML = '<i id="setinha" class="fas fa-angle-down"></i>';-->
      <!--// document.getElementById(drop).style.display='block':-->
    <!--}-->
  <!--}-->

  <!--function seta(ide) {-->
    <!--setinha = document.getElementById(ide).querySelectorAll("#setinha");-->
    <!--if (setinha[0].className == 'fas fa-angle-down') {-->
      <!--document.getElementById(ide).innerHTML = '<i id="setinha" class="fas fa-angle-up"></i>'-->
    <!--} else {-->
      <!--document.getElementById(ide).innerHTML = '<i id="setinha" class="fas fa-angle-down"></i>'-->
    <!--}-->
  <!--};-->

</script>
%include('gestao_aprendizagem/footer/footer.tpl')