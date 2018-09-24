%include('gestao_aprendizagem/header/header.tpl', title="Gestão Aprendizagem", css="css-listagem-escolas.css")
%include('gestao_aprendizagem/menu/menu.tpl')
<div class="col-md-9 order-md-3 botao-tabela" style="margin-top: 6px;">
  <div class="container">
    <div class="row">
      <div class=" col-md-3">
        <p class="top-escolas-tabela">Turma</p>
        % if tipo != '3':
        <button type="button" class="botao-nova-escola" onclick="document.getElementById('new_school').style.display = 'inline'">
          <i class="fas fa-plus"></i>
          &nbsp;Nova Turma
        </button>
        % end
      </div>
      <div class="col-md-4 offset-md-5">
        <form class="form">
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
      </form>
    </div>
    <!--fim da div de pesquisa-->
  </div>
  <!--fim da row do conteudo acima da tabela -->
  <br />
  <br />
  %if tipo != '3':
  <div id="new_school" style="display:none;">
    %include('gestao_aprendizagem/turma/formulario_cadastro_nova_turma.tpl')
  </div>
  %end
  <div id="accordion">
    <!-- inicio da tabela -->

    <div class="row">
      <div class="col-md-5 item-tabela topo-tab">
        Nome da Turma
      </div>

      <div class="col-md-2 item-tabela topo-tab">
        Professor
      </div>

      <div class="col-md-2 item-tabela topo-tab">
        Escola
      </div>
      <div class="col-md-2 item-tabela topo-tab">
        Série
      </div>
      <div class="col-md-1 item-tabela topo-tab">
      </div>
    </div>
    <!-- bloco de cabeçalho da lista -->
    % if isinstance(turma,list):

    % for index,i in enumerate(turma):
      % if index % 2 ==0:
        <div class="row row-par">
          %include('gestao_aprendizagem/turma/turma_edicao_par.tpl')
        </div>
      % else:
        <div class="row row-impar">
          <input type="hidden" id ="id_escola" value="{{i['id']}}">
          %include('gestao_aprendizagem/turma/turma_edicao_impar.tpl')
        </div>
      % end
    % end

    % else:
    <h2>Você não está cadastrado a nenhuma turma.</h2>
    % end
  </div>
</div>
</div>
<script type="text/javascript" src="../static/js/jquery-3.3.1-min.js"></script>
<script type="text/javascript">

  function test(ide) {
    console.log(ide);
    y = document.getElementById(ide).innerHTML;
    x = document.getElementById("nova-escola").style.display;
    console.log(x, y)
    if (x == "none") {
      document.getElementById("nova-escola").style.display = 'block';
      document.getElementById(ide).innerHTML = '<i class="fas fa-angle-up"></i>';
    }
    else {
      document.getElementById("nova-escola").style.display = 'none';
      document.getElementById(ide).innerHTML = '<i class="fas fa-angle-down"></i>';
      // document.getElementById(drop).style.display='block':
    }
  }

  function seta(ide) {
    setinha = document.getElementById(ide).querySelectorAll("#setinha");
    if (setinha[0].className == 'fas fa-angle-down') {
      document.getElementById(ide).innerHTML = '<i id="setinha" class="fas fa-angle-up"></i>';
    } else {
      document.getElementById(ide).innerHTML = '<i id="setinha" class="fas fa-angle-down"></i>';
    }
  };

  function sumir() {

    $('#modal-dar-medalha').on('show.bs.modal', function () {
      $('#medalha_janela').css('display', 'none');

    });

    $('#modal-dar-medalha').on('hidden.bs.modal', function () {
      $('#medalha_janela').css('display', 'block');
    });
  }

  idMedalha = [];
  function getIdMedalha(id) {
    index = idMedalha.indexOf(id);
    index == -1 ? idMedalha.push(id) : idMedalha.splice(index, 1);
  }

  function entregarMedalha(alunoid) {
    for (i = 0; i < idMedalha.length; i++) {
      motivo = document.getElementById('medalha_motivo_' + idMedalha[i]).value;
      $.post('/turma/entregar_medalha_aluno', { aluno: alunoid, medalha: idMedalha[i], motivo: motivo }, function (data) {
        if (data == '0') {
          break;
        }
      });
    }
    if (i == idMedalha.length) {
      window.location.replace('/turma');
      alert("Medalha foi entregue com sucesso!");
    } else {
      alert("Erro");
    }
  }

  function entregarMedalhaTodos(turmaId) {
    for (i = 0; i < idMedalha.length; i++) {
      motivo = document.getElementById('medalha_motivo_' + idMedalha[i]).value;
      $.post('/turma/entregar_medalha_todos_alunos', { turma: turmaId, medalha: idMedalha[i], motivo: motivo }, function (data) {
        alert(data);
        if (data == '0') {
          break;
        }
      });
    }
    if (i == idMedalha.length) {
      window.location.replace('/turma');
      alert("Medalha foi entregue com sucesso!");
    } else {
      alert("Erro");
    }
  }
</script>
%include('gestao_aprendizagem/footer/footer.tpl')