# spec/simulador_fila_spec.rb

require 'organizador_fila_atendimento_gem'

RSpec.describe OrganizadorFilaAtendimentoGem::SimuladorFila do
  describe '#tempo_chegada_cliente' do
    it 'gera um tempo de chegada de cliente entre 1 e 10 minutos' do
      simulador = described_class.new
      tempo_chegada = simulador.tempo_chegada_cliente
      expect(tempo_chegada).to be_between(1, 10)
    end
  end

  describe '#tempo_atendimento' do
    it 'gera um tempo de atendimento entre 5 e 20 minutos' do
      simulador = described_class.new
      tempo_atendimento = simulador.tempo_atendimento
      expect(tempo_atendimento).to be_between(5, 20)
    end
  end
end
