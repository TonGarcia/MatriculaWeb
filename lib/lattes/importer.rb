module Lattes
  class Importer
    include Singleton

    def get_single_cv(lattes_xml_body)
      xml_dict = Hash.from_xml(lattes_xml_body)['CURRICULO_VITAE']
      researcher_xml = xml_dict['DADOS_GERAIS']
      researcher_professional_data = researcher_xml['ENDERECO']['ENDERECO_PROFISSIONAL']
      address = [researcher_professional_data['BAIRRO'], researcher_professional_data['LOGRADOURO_COMPLEMENTO']].join(' ')

      degrees = []
      researches = []
      experiences = []

      researcher_dict = {
        address: address,
        full_name: researcher_xml['NOME_COMPLETO'],
        phone: researcher_professional_data['TELEFONE'],
        state: researcher_professional_data['UF'],
        city: researcher_professional_data['CIDADE'],
        country: alpha2(researcher_xml['PAIS_DE_NASCIMENTO']),
        cover_letter: researcher_xml['RESUMO_CV']['TEXTO_RESUMO_CV_RH']
      }

      researcher_xml['FORMACAO_ACADEMICA_TITULACAO'].each do |k, v|
        degrees << {
            level: k,
            course: v['NOME_CURSO'],
            start_year: v['ANO_DE_INICIO'],
            end_year: v['ANO_DE_CONCLUSAO'],
            university: {
                name: v['NOME_INSTITUICAO']
            }
        }
      end

      xml_dict['PRODUCAO_BIBLIOGRAFICA'].values.each do |prod_xml|
        prod_xml.values.each do |prod_arr|
          prod_arr.each do |prod|
            prod_basic = prod['DADOS_BASICOS_DO_TRABALHO']
            country = prod_basic['PAIS_DO_EVENTO']
            year = prod_basic['ANO_DO_TRABALHO']

            keywords = nil

            if !keywords.nil? && keywords.is_a?(Array)
              keywords = prod['PALAVRAS_CHAVE'].values
              keywords = keywords.join(' ')
            end

            researches << {
                year: year,
                country: alpha2(country),
                description: keywords
            }
          end
        end
      end

      xml_dict['PRODUCAO_TECNICA'].values.each do |prod_tec_xml|
        prod_tec_xml.each do |prod_tec|
          basic_data_key = nil
          prod_tec.keys.each {|k| basic_data_key = k if k.index('DADOS_BASICOS') >= 0}
          prod_tec_basic = prod_tec[basic_data_key]
          researches << {
              year: prod_tec_basic['ANO'],
              country: alpha2(prod_tec_basic['ANO']),
              description: prod_tec['PALAVRAS_CHAVE'].join(' ')
          }
        end
      end


      # researches_keys (xml_dict)
      a = ['PRODUCAO_BIBLIOGRAFICA', 'PRODUCAO_TECNICA']

      # experiences keys (researcher_xml)
      b = ['ATUACOES_PROFISSIONAIS', 'PREMIOS_TITULOS']

      researcher_xml['PRODUCAO_BIBLIOGRAFICA']

      researcher_xml['ATUACOES_PROFISSIONAIS']['ATUACAO_PROFISSIONAL'].each do |exp_xml|
        exp_xml['NOME_INSTITUICAO']
        experience = {

        }
      end

      xml_dict['PRODUCAO_BIBLIOGRAFICA'].each do |key, val|
        puts key
      end

      researchers_db_dict = {
          researcher: researcher_dict,
          experiences: experiences,
          researches: [],
          degrees: degrees
      }

      researchers_db_dict
    end

    private
    def deep_data(lattes_obj)
      data = []
      singularize = lattes_obj.values
      singularize.each do |singular|
        singular.values[0].each do |research|
          research_data = research['DADOS_BASICOS_DO_TRABALHO']
          data << {
              year: research_data['ANO_DO_TRABALHO'],
              description: research['PALAVRAS_CHAVE'].values.join(' '),
              country: alpha2(research_data['PAIS_DO_EVENTO'])
          }
        end
      end

      data
    end

    def alpha2(country_name)
      country_name = country_name.downcase
      ISO3166::Country.translations(:pt).each {|k, v| return k if v.downcase == country_name}
    end
  end
end