import unittest
# from unittest.mock import MagicMock
import bottle

from src.facade.facade import *


class FacadeTest(unittest.TestCase):
    def setUp(self):
        self.facade = Facade()

    """TESTE USUARIO/ALUNO"""

    def _create_aluno(self):
        aluno = self.facade.create_aluno_facade("egg", "123")
        self.assertEqual(aluno, True)

    def _create_aluno_senha_vazia(self):
        aluno = self.facade.create_aluno_facade("Brian", "")
        self.assertTrue(aluno, TypeError)

    def _create_aluno_fail(self):
        aluno = self.facade.create_aluno_facade("Brian", "123")
        self.assertEqual(aluno, TypeError)

        aluno = self.facade.create_aluno_facade("egg", "")
        self.assertEqual(aluno, True)

    def _update_aluno(self):
        aluno = self.facade.pesquisa_aluno_facade("egg")
        updadate = self.facade.update_aluno_facade(aluno.id, "knight", "ni")
        self.assertIs(updadate, True)
        updadate = self.facade.update_aluno_facade(aluno.id, "egg", "")
        self.assertIs(updadate, False)

    def _pesquisa_aluno(self):
        aluno = self.facade.pesquisa_aluno_facade("Brian")
        self.assertIs(aluno,aluno)
        aluno = self.facade.pesquisa_aluno_facade("Sily walk")
        self.assertIs(aluno, None)

    def _pontos_jogo(self):
        aluno = self.facade.ponto_jogo_facade("Brian","j1",1)
        self.assertIs(aluno,True)
        aluno = self.facade.ponto_jogo_facade("Brian", "j1", None)
        self.assertIs(aluno, False)

    def _delete_alunos(self):
        alunos = self.facade.read_aluno_facade()
        escolhidos = []
        for aluno in alunos:
            escolhidos += [aluno['id']]
        self.facade.delete_aluno_facade(escolhidos)

    """Métododos de Test"""
    def test_create_aluno(self):
        self._create_aluno()

    def test_create_aluno_senha_vazia(self):
        self._create_aluno_senha_vazia()

    @unittest.expectedFailure
    def test_create_aluno_fail(self):
        self._create_aluno_fail()

    def test_create_update_aluno(self):
        self._update_aluno()

    def test_pesquisa_aluno(self):
        self._pesquisa_aluno()

    def _test_pontos_jogo(self):
        self._pontos_jogo()

    def test_delete_alunos(self):
        self._pontos_jogo()
        self._delete_alunos()

    """FIM TESTE USUARIO/ALUNO"""

    """TESTE LOJA"""

    def _create_turma(self):
        turma = self.facade.create_turma_facade("Knigh","Ni")
        self.assertIs(turma,True)
        turma = self.facade.create_turma_facade("Knigh", "Ni")

    def test_create_turma(self):
        self._create_turma()

    """FIM TESTE LOJA"""

    """TESTE REDE"""
    def _create_rede(self):
        rede = self.facade.create_rede_facade("egg", "2546","(21)9999-9999")
        self.assertIs(rede,True)

    def _update_rede(self):
        pass

    def _delete_rede(self):
        rede = self.facade.read_rede_facade()
        escolhidos = []
        for redes in rede:
            escolhidos.append(redes['id'])
        self.facade.delete_rede_facade(escolhidos)

    def _pesquisa_rede(self):
        aluno = self.facade.pesquisa_aluno_facade("Brian")
        self.assertIs(aluno,aluno)
        aluno = self.facade.pesquisa_aluno_facade("Sily walk")
        self.assertIs(aluno, None)

    def test_create_rede(self):
        self._create_rede()

    def test_delete_rede(self):
        self._delete_rede()
    """FIM TESTE REDE"""