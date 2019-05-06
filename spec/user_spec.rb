RSpec.describe GithubApi::V4::User do
  subject { described_class.new(username) }

  context 'with correct username' do
    context 'with Ruby as favorite language' do
      let(:username) { 'ivanelrey' }

      describe '#favorite_language' do
        it 'returns Ruby as favorite language' do
          VCR.use_cassette("ruby_fav_language") do
            expect(subject.favorite_language).to eq 'Ruby'
          end
        end
      end
    end

    context 'with 0 repositories' do
      let(:username) { 'asdasdasdasdasd' }

      describe '#favorite_language' do
        it 'returns "User has 0 repositories."' do
          VCR.use_cassette("zero_repos") do
            expect(subject.favorite_language).to eq 'User has 0 repositories.'
          end
        end
      end
    end
  end

  context 'with wrong username' do
    let(:username) { 'ivanelrey_1234567' }

    describe '#favorite_language' do
      it 'raises a QueryExecutionError when user does not exist' do
        VCR.use_cassette("wrong_username") do
          expect {
            subject.favorite_language
          }.to raise_error(GithubApi::V4::QueryExecutionError)
        end
      end
    end
  end
end
